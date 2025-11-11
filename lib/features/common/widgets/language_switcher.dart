import 'package:flutter/material.dart';
import 'package:infra/core/localization/app_language.dart';
import 'package:infra/core/localization/language_controller.dart';
import 'package:infra/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LanguageController>();
    final l10n = AppLocalizations.of(context)!;
    final segments = [
      ButtonSegment<AppLanguage>(
        value: AppLanguage.ru,
        label: Text(AppLanguage.ru.emoji, style: const TextStyle(fontSize: 16)),
        tooltip: l10n.languageRu,
      ),
      ButtonSegment<AppLanguage>(
        value: AppLanguage.en,
        label: Text(AppLanguage.en.emoji, style: const TextStyle(fontSize: 16)),
        tooltip: l10n.languageEn,
      ),
    ];
    return SegmentedButton<AppLanguage>(
      segments: segments,
      selected: {controller.language},
      style: SegmentedButton.styleFrom(
        visualDensity: compact ? VisualDensity.compact : VisualDensity.standard,
      ),
      onSelectionChanged: (selection) {
        final next = selection.first;
        context.read<LanguageController>().update(next);
      },
    );
  }
}
