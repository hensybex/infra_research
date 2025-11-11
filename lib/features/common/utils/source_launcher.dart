import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infra/data/models/document_record.dart';
import 'package:infra/data/repositories/document_repository.dart';
import 'package:infra/data/services/document_registry.dart';
import 'package:infra/features/navigation/nav_config.dart';
import 'package:infra/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

final _navRoutesBySlug = researchSlugToRoute();

class SourceLauncher {
  static Future<void> open(
    BuildContext context,
    DocumentRepository repository,
    String reference,
  ) async {
    final registry = DocumentRegistry.instance;
    final preferredLanguage = repository.languageCode;
    final record = registry.resolve(
      reference,
      preferredLanguage: preferredLanguage,
    );

    if (record != null && record.kind == DocumentKind.note) {
      if (!context.mounted) return;
      context.push(
        '/document/${Uri.encodeComponent(record.slug)}',
        extra: record,
      );
      return;
    }

    if (record != null && record.kind == DocumentKind.report) {
      final report = repository.findById(record.slug);
      if (record.slug.isNotEmpty && _navRoutesBySlug.containsKey(record.slug)) {
        if (context.mounted) {
          context.go(_navRoutesBySlug[record.slug]!);
        }
        return;
      }
      if (report != null && context.mounted) {
        context.push('/report/${Uri.encodeComponent(report.id)}');
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.sourceUnavailable),
          ),
        );
      }
      return;
    }

    if (reference.startsWith('http')) {
      final uri = Uri.tryParse(reference);
      if (uri != null) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return;
      }
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.sourceUnavailable),
        ),
      );
    }
  }
}
