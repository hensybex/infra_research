import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:infra/core/localization/app_language.dart';
import 'package:infra/data/models/document_record.dart';
import 'package:infra/data/models/note_document.dart';
import 'package:infra/data/models/report_document.dart';
import 'package:infra/data/models/report_tag.dart';
import 'package:infra/data/models/source_entry.dart';
import 'package:infra/data/services/asset_manifest_loader.dart';
import 'package:infra/data/services/document_registry.dart';
import 'package:infra/data/services/report_parser.dart';

enum RepositoryStatus { idle, loading, ready, error }

class DocumentRepository extends ChangeNotifier {
  DocumentRepository({
    AssetManifestLoader? manifestLoader,
    ReportParser? parser,
  }) : _manifestLoader = manifestLoader ?? const AssetManifestLoader(),
       _parser = parser ?? const ReportParser();

  final AssetManifestLoader _manifestLoader;
  final ReportParser _parser;

  RepositoryStatus status = RepositoryStatus.idle;
  String? errorMessage;

  AppLanguage _language = AppLanguage.ru;
  List<ReportDocument> _reports = [];

  final Map<AppLanguage, List<ReportDocument>> _documentsByLanguage = {};
  final Map<AppLanguage, Map<String, ReportDocument>> _documentsIndex = {};
  final Map<AppLanguage, Map<String, List<ReportDocument>>> _searchCache = {};
  final Map<AppLanguage, List<String>> _noteAssetsByLanguage = {};
  final Map<String, NoteDocument?> _noteCache = {};

  List<ReportDocument> get reports => _reports;
  List<SourceEntry> get allSources =>
      _reports.expand((doc) => doc.sources).toList();
  AppLanguage get language => _language;
  String get languageCode => _language.languageCode;

  Future<void> setLanguage(AppLanguage language) async {
    if (_language == language && status == RepositoryStatus.ready) {
      return;
    }
    _language = language;
    await _ensureLanguageLoaded(language);
  }

  Future<void> _ensureLanguageLoaded(AppLanguage language) async {
    if (_documentsByLanguage.containsKey(language)) {
      _applyLanguage(language);
      return;
    }
    await _loadLanguage(language);
  }

  Future<void> _loadLanguage(AppLanguage language) async {
    status = RepositoryStatus.loading;
    errorMessage = null;
    notifyListeners();
    try {
      final reportAssets = await _resolveReportAssets(language);
      final documents = <ReportDocument>[];
      final index = <String, ReportDocument>{};
      for (final asset in reportAssets) {
        final body = await rootBundle.loadString(asset);
        final report = await _parser.parse(asset, body);
        documents.add(report);
        index[report.id] = report;
      }
      documents.sort((a, b) => a.code.compareTo(b.code));
      _documentsByLanguage[language] = documents;
      _documentsIndex[language] = index;
      final noteAssets = await _resolveNoteAssets(language);
      _noteAssetsByLanguage[language] = noteAssets;
      _applyLanguage(language);
      status = RepositoryStatus.ready;
    } catch (error, stackTrace) {
      debugPrint(
        'Failed to load reports for ${language.name}: $error\n$stackTrace',
      );
      status = RepositoryStatus.error;
      errorMessage = error.toString();
      notifyListeners();
    }
  }

  void _applyLanguage(AppLanguage language) {
    _reports = _documentsByLanguage[language] ?? [];
    _searchCache.putIfAbsent(language, () => {});
    status = RepositoryStatus.ready;
    notifyListeners();
  }

  ReportDocument? findById(String id) => _documentsIndex[_language]?[id];

  ReportDocument? findByReference(String reference) {
    final registryEntry = DocumentRegistry.instance.resolve(
      reference,
      preferredLanguage: _language.languageCode,
    );
    if (registryEntry != null && registryEntry.kind == DocumentKind.report) {
      return findById(registryEntry.slug);
    }
    final slug = reference
        .split('/')
        .last
        .replaceAll('.md', '')
        .replaceAll('.', '_')
        .toLowerCase();
    return findById(slug);
  }

  List<ReportDocument> search(String query, {Set<ReportTag> tags = const {}}) {
    final normalizedQuery = query.trim().toLowerCase();
    final tagKey = tags.map((tag) => tag.code).toList()..sort();
    final cacheKey = '$normalizedQuery|${tagKey.join(',')}';
    final cache = _searchCache[_language] ?? {};
    if (cache.containsKey(cacheKey)) {
      return cache[cacheKey]!;
    }

    Iterable<ReportDocument> filtered = _reports;
    if (tags.isNotEmpty) {
      filtered = filtered.where((doc) => doc.tags.any(tags.contains));
    }
    if (normalizedQuery.isNotEmpty) {
      filtered = filtered.where(
        (doc) =>
            doc.title.toLowerCase().contains(normalizedQuery) ||
            doc.body.toLowerCase().contains(normalizedQuery),
      );
    }
    final results = filtered.toList();
    cache[cacheKey] = results;
    _searchCache[_language] = cache;
    return results;
  }

  Future<NoteDocument?> loadNote(String relativePath) async {
    final registryEntry = DocumentRegistry.instance.resolve(
      relativePath,
      preferredLanguage: _language.languageCode,
    );
    final candidateSet = <String>{};
    if (registryEntry != null) {
      candidateSet.add(registryEntry.assetPath);
    }
    final sanitized = relativePath.startsWith('assets/')
        ? relativePath.substring(7)
        : relativePath;
    final hasExplicitPrefix =
        sanitized.startsWith('eng/') || sanitized.startsWith('rus/');
    if (hasExplicitPrefix) {
      candidateSet.add('assets/$sanitized');
    } else {
      candidateSet.add('assets/${_language.assetSegment}/$sanitized');
      for (final lang in AppLanguage.values) {
        candidateSet.add('assets/${lang.assetSegment}/$sanitized');
      }
      candidateSet.add('assets/$sanitized');
    }
    for (final assetPath in candidateSet) {
      if (_noteCache.containsKey(assetPath)) {
        return _noteCache[assetPath];
      }
      final body = await _readAssetString(assetPath);
      if (body == null) {
        continue;
      }
      final titleLine = body
          .split('\n')
          .firstWhere(
            (line) => line.trim().startsWith('# '),
            orElse: () => sanitized.split('/').last,
          );
      final title = titleLine.replaceFirst(RegExp(r'^#\s+'), '').trim();
      final note = NoteDocument(path: assetPath, title: title, body: body);
      _noteCache[assetPath] = note;
      return note;
    }
    if (candidateSet.isNotEmpty) {
      _noteCache[candidateSet.last] = null;
    }
    return null;
  }

  Future<List<String>> _resolveReportAssets(AppLanguage language) async {
    final localized = await _manifestLoader.listAssets(
      'assets/${language.assetSegment}/reports/',
    );
    if (localized.isNotEmpty) {
      return localized..sort();
    }
    final legacy = await _manifestLoader.listAssets('assets/reports/');
    final filtered = legacy
        .where((path) => _matchesLegacyLanguage(path, language))
        .toList();
    return (filtered.isNotEmpty ? filtered : legacy)..sort();
  }

  Future<List<String>> _resolveNoteAssets(AppLanguage language) async {
    final localized = await _manifestLoader.listAssets(
      'assets/${language.assetSegment}/notes/',
    );
    if (localized.isNotEmpty) {
      return localized..sort();
    }
    final legacy = await _manifestLoader.listAssets('assets/notes/');
    final filtered = legacy
        .where((path) => _matchesLegacyLanguage(path, language))
        .toList();
    return (filtered.isNotEmpty ? filtered : legacy)..sort();
  }

  bool _matchesLegacyLanguage(String path, AppLanguage language) {
    final isRu = path.contains('.ru.') || path.contains('_ru.');
    if (language == AppLanguage.ru) {
      return isRu;
    }
    return !isRu;
  }

  Future<String?> _readAssetString(String assetPath) async {
    try {
      return await rootBundle.loadString(assetPath);
    } catch (error) {
      debugPrint('Asset load failed for $assetPath: $error');
      if (kIsWeb) return null;
      final file = File(assetPath);
      if (await file.exists()) {
        return file.readAsString();
      }
      return null;
    }
  }
}
