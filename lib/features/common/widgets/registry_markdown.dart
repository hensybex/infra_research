import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:infra/data/repositories/document_repository.dart';
import 'package:infra/data/services/document_registry.dart';
import 'package:infra/features/common/utils/source_launcher.dart';

class RegistryMarkdown extends StatelessWidget {
  const RegistryMarkdown({
    super.key,
    required this.data,
    required this.repository,
    this.preferredLanguageCode,
    this.onTapLink,
    this.styleSheet,
    this.builders = const {},
    this.shrinkWrap = false,
  });

  final String data;
  final DocumentRepository repository;
  final String? preferredLanguageCode;
  final MarkdownTapLinkCallback? onTapLink;
  final MarkdownStyleSheet? styleSheet;
  final Map<String, MarkdownElementBuilder> builders;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final languageCode = preferredLanguageCode ?? repository.languageCode;
    final normalizedData = _normalizeKeeperSpacing(data);
    final hydratedData = _replaceKeeperLinks(
      normalizedData,
      languageCode: languageCode,
    );
    final tapHandler = onTapLink;
    return Builder(
      builder: (context) => MarkdownBody(
        data: hydratedData,
        onTapLink: (text, href, title) =>
            _handleTap(context, repository, href, tapHandler, text, title),
        styleSheet: styleSheet,
        shrinkWrap: shrinkWrap,
        builders: builders,
      ),
    );
  }

  String _normalizeKeeperSpacing(String input) {
    final pattern = RegExp(r'\r?\n(?=\s*\{\{doc:)');
    return input.replaceAll(pattern, ' ');
  }

  String _replaceKeeperLinks(String input, {required String languageCode}) {
    final registry = DocumentRegistry.instance;
    final pattern = RegExp(r'\{\{doc:([^\}|]+)(?:\|([^\}]+))?\}\}');
    return input.replaceAllMapped(pattern, (match) {
      final slug = match.group(1)?.trim() ?? '';
      final explicitLabel = match.group(2)?.trim();
      final record = registry.resolveBySlug(
        slug,
        preferredLanguage: languageCode,
      );
      final label = (explicitLabel?.isNotEmpty ?? false)
          ? explicitLabel!
          : (record?.displayName ?? slug);
      final uri = Uri(scheme: 'doc', host: slug);
      final sanitizedLabel = label.replaceAll('\n', ' ').trim();
      return '[$sanitizedLabel]($uri)';
    });
  }

  void _handleTap(
    BuildContext context,
    DocumentRepository repository,
    String? href,
    MarkdownTapLinkCallback? externalTap,
    String text,
    String? title,
  ) async {
    if (href == null) return;
    if (href.startsWith('doc://')) {
      final slug = Uri.parse(href).host;
      final entry = DocumentRegistry.instance.resolveBySlug(
        slug,
        preferredLanguage: repository.languageCode,
      );
      if (entry != null) {
        await SourceLauncher.open(context, repository, entry.reference);
      }
      return;
    }
    if (href.startsWith('#')) return;
    if (externalTap != null) {
      externalTap(text, href, title ?? '');
      return;
    }
    await SourceLauncher.open(context, repository, href);
  }
}
