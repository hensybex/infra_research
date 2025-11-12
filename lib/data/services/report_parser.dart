import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:infra/data/models/report_document.dart';
import 'package:infra/data/models/report_tag.dart';
import 'package:infra/data/models/source_entry.dart';

class ReportParser {
  const ReportParser();

  Future<ReportDocument> parse(String path, String body) {
    return compute(
      _parseReportDocument,
      _ReportParserJob(path: path, body: body),
    );
  }
}

class _ReportParserJob {
  const _ReportParserJob({required this.path, required this.body});
  final String path;
  final String body;
}

ReportDocument _parseReportDocument(_ReportParserJob job) {
  final lines = const LineSplitter().convert(job.body);
  final titleLine = lines.firstWhere(
    (line) => line.trimLeft().startsWith('# '),
    orElse: () => 'Untitled',
  );
  final title = titleLine.replaceFirst(RegExp(r'^#\s+'), '').trim();
  final slug = _slugFromPath(job.path);
  final code = _codeFromSlug(slug);
  final language = job.path.contains('.ru.') || job.path.contains('_ru')
      ? 'ru'
      : 'en';

  final summary = _extractSummary(lines, titleLine);
  final sections = _extractSections(lines);
  final sources = _extractSources(lines, slug);
  final cleanedBody = _removeSourcesSection(lines);
  final body = _removePrimaryHeading(cleanedBody);
  final tags = _inferTags(code);
  final wordCount = _estimateWords(job.body);

  return ReportDocument(
    id: slug,
    code: code,
    title: title,
    path: job.path,
    languageCode: language,
    sections: sections,
    body: body,
    wordCount: wordCount,
    tags: tags,
    summary: summary,
    sources: sources,
  );
}

String _slugFromPath(String path) {
  final fileName = path.split('/').last;
  final sanitized = fileName
      .replaceFirst(RegExp(r'\.ru(?=\.md$)', caseSensitive: false), '')
      .replaceAll('.md', '');
  return sanitized.replaceAll('.', '_').toLowerCase();
}

String _codeFromSlug(String slug) {
  final match = RegExp(r'^(dr[\d_]+)').firstMatch(slug);
  if (match == null) {
    return slug.toUpperCase();
  }
  return match.group(1)!.toUpperCase().replaceAll('_', '.');
}

Set<ReportTag> _inferTags(String code) {
  final normalized = code.toLowerCase();
  final tags = <ReportTag>{};
  if (normalized.startsWith('dr1')) {
    tags.add(ReportTag.architecture);
  }
  if (normalized.startsWith('dr2.5')) {
    tags.addAll({ReportTag.compliance, ReportTag.roadmap});
  }
  if (normalized.startsWith('dr2') && !normalized.startsWith('dr2.5')) {
    tags.add(ReportTag.roadmap);
  }
  if (normalized.startsWith('dr3')) {
    tags.add(ReportTag.value);
  }
  if (tags.isEmpty) {
    tags.add(ReportTag.architecture);
  }
  return tags;
}

String? _extractSummary(List<String> lines, String titleLine) {
  final startIndex = lines.indexOf(titleLine) + 1;
  final buffer = StringBuffer();
  for (var i = startIndex; i < lines.length; i++) {
    final line = lines[i].trim();
    if (line.isEmpty) {
      if (buffer.isNotEmpty) break;
      continue;
    }
    if (line.startsWith('#')) break;
    buffer.write(line);
    if (!line.endsWith('.')) buffer.write(' ');
  }
  final summary = buffer.toString().trim();
  return summary.isEmpty ? null : summary;
}

List<ReportSection> _extractSections(List<String> lines) {
  final sections = <ReportSection>[];
  for (final raw in lines) {
    if (raw.startsWith('## ')) {
      sections.add(_sectionFromLine(raw, level: 2));
    } else if (raw.startsWith('### ')) {
      sections.add(_sectionFromLine(raw, level: 3));
    }
  }
  return sections;
}

ReportSection _sectionFromLine(String line, {required int level}) {
  final title = line.replaceFirst(RegExp(r'^#+\s+'), '').trim();
  final anchor = title
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9а-яё ]', caseSensitive: false), '')
      .trim()
      .replaceAll(RegExp(r'\s+'), '-');
  return ReportSection(anchor: anchor, title: title, level: level);
}

List<SourceEntry> _extractSources(List<String> lines, String slug) {
  final sources = <SourceEntry>[];
  final start = lines.indexWhere(
    (line) =>
        line.toLowerCase().startsWith('## источники') ||
        line.toLowerCase().startsWith('## sources'),
  );
  if (start == -1) {
    return sources;
  }
  for (var i = start + 1; i < lines.length; i++) {
    final line = lines[i];
    if (line.startsWith('## ')) break;
    final trimmed = line.trim();
    if (trimmed.isEmpty) continue;
    final bulletMatch = RegExp(r'^[-*]\s+(.*)$').firstMatch(trimmed);
    final text = bulletMatch != null ? bulletMatch.group(1)! : trimmed;
    final type = _detectSourceType(text);
    sources.add(
      SourceEntry(
        reportId: slug,
        label: text,
        type: type,
        reference: _extractReference(text),
      ),
    );
  }
  return sources;
}

String _removeSourcesSection(List<String> lines) {
  final buffer = <String>[];
  int index = 0;
  while (index < lines.length) {
    final line = lines[index];
    final lower = line.toLowerCase();
    if (lower.startsWith('## источники') || lower.startsWith('## sources')) {
      index++;
      while (index < lines.length && !lines[index].startsWith('## ')) {
        index++;
      }
      continue;
    }
    buffer.add(line);
    index++;
  }
  return buffer.join('\n').trim();
}

String _removePrimaryHeading(String body) {
  final lines = body.split('\n');
  var removedHeading = false;
  var removedSpacer = false;
  final buffer = <String>[];
  for (final line in lines) {
    if (!removedHeading && line.trimLeft().startsWith('# ')) {
      removedHeading = true;
      continue;
    }
    if (removedHeading && !removedSpacer) {
      if (line.trim().isEmpty) {
        removedSpacer = true;
        continue;
      }
      removedSpacer = true;
    }
    buffer.add(line);
  }
  final cleaned = buffer.join('\n');
  return removedHeading ? cleaned.trimLeft() : body;
}

bool _isNoteReference(String text) =>
    text.contains('eng/notes/') ||
    text.contains('rus/notes/') ||
    text.contains('notes/');

bool _isReportReference(String text) =>
    text.contains('eng/reports/') ||
    text.contains('rus/reports/') ||
    text.contains('reports/');

SourceType _detectSourceType(String text) {
  if (_isNoteReference(text)) {
    return SourceType.internal;
  }
  if (_isReportReference(text)) {
    return SourceType.internal;
  }
  if (text.contains('http://') || text.contains('https://')) {
    return SourceType.external;
  }
  return SourceType.external;
}

String? _extractReference(String text) {
  final match = RegExp(
    r'((?:eng|rus)/notes/[^\s,;]+|notes/[^\s,;]+|(?:eng|rus)/reports/[^\s,;]+|reports/[^\s,;]+|https?://[^\s)]+)',
  ).firstMatch(text);
  if (match != null) {
    return match.group(1)!.replaceAll(RegExp(r'[.,;]+$'), '');
  }
  final backtick = RegExp(r'`([^`]+)`').firstMatch(text);
  return backtick?.group(1);
}

int _estimateWords(String body) {
  final sanitized = body
      .replaceAll(RegExp(r'[`*_#>\-|]'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
  if (sanitized.isEmpty) return 0;
  return max(1, sanitized.split(' ').length);
}
