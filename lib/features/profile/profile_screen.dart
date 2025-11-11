import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:go_router/go_router.dart';
import 'package:infra/data/models/recommendation_letter.dart';
import 'package:infra/data/static/recommendation_letters.dart';
import 'package:infra/l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _email = 'kamenetskiyto@gmail.com';
  static const _telegram = 'https://t.me/hensybex2';
  static const _researchPackAsset = 'assets/bundles/research_pack.zip';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
      children: [
        Text(
          l10n.profileTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        _ContactCard(l10n: l10n),
        const SizedBox(height: 12),
        _PitchPackCard(
          onDownload: () => _savePitchPack(context),
          onShare: () => Share.share(l10n.sharePackMessage),
        ),
        const SizedBox(height: 12),
        _PresentationCard(
          onLaunch: () => GoRouter.of(context).push('/presentation'),
        ),
        const SizedBox(height: 12),
        _RecommendationLettersCard(letters: recommendationLetters),
      ],
    );
  }

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _savePitchPack(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final data = await rootBundle.load(_researchPackAsset);
      await FileSaver.instance.saveFile(
        name: 'infra_research_pack',
        bytes: data.buffer.asUint8List(),
        ext: 'zip',
        mimeType: MimeType.zip,
      );
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.profilePitchSaveSuccess)));
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.profilePitchSaveError)));
    }
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.profileLeadershipHeading,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(l10n.profileLeadershipIntro),
            const SizedBox(height: 12),
            _ContactRow(
              label: l10n.profileTimLabel,
              value: l10n.profileTimInfo,
            ),
            _ContactRow(
              label: l10n.profileRitaLabel,
              value: l10n.profileRitaInfo,
            ),
            const SizedBox(height: 16),
            Text(l10n.profileSla),
            const SizedBox(height: 16),
            Text(l10n.profileReachHeading, style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: () => ProfileScreen._launchUrl(
                    'mailto:${ProfileScreen._email}',
                  ),
                  icon: const Icon(Icons.email_outlined),
                  label: const Text(ProfileScreen._email),
                ),
                OutlinedButton.icon(
                  onPressed: () =>
                      ProfileScreen._launchUrl(ProfileScreen._telegram),
                  icon: const Icon(Icons.telegram),
                  label: Text(l10n.profileTelegramLabel),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PitchPackCard extends StatelessWidget {
  const _PitchPackCard({required this.onDownload, required this.onShare});

  final VoidCallback onDownload;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.profilePitchHeading,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(l10n.profilePitchBody),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: onDownload,
                  icon: const Icon(Icons.download),
                  label: Text(l10n.profilePitchDownload),
                ),
                OutlinedButton.icon(
                  onPressed: onShare,
                  icon: const Icon(Icons.share_outlined),
                  label: Text(l10n.profilePitchShare),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PresentationCard extends StatelessWidget {
  const _PresentationCard({required this.onLaunch});

  final VoidCallback onLaunch;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.presentationCardTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.presentationCardBody,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                backgroundColor: colorScheme.onPrimaryContainer,
                foregroundColor: colorScheme.primaryContainer,
              ),
              onPressed: onLaunch,
              icon: const Icon(Icons.slideshow),
              label: Text(l10n.presentationLaunchCta),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecommendationLettersCard extends StatelessWidget {
  const _RecommendationLettersCard({required this.letters});

  final List<RecommendationLetter> letters;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.profileLettersHeading,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(l10n.profileLettersBody),
            const SizedBox(height: 16),
            for (var i = 0; i < letters.length; i++) ...[
              _LetterTile(
                letter: letters[i],
                languageCode: languageCode,
                l10n: l10n,
              ),
              if (i != letters.length - 1) ...[
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class _LetterTile extends StatelessWidget {
  const _LetterTile({
    required this.letter,
    required this.languageCode,
    required this.l10n,
  });

  final RecommendationLetter letter;
  final String languageCode;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final summary = letter.summaryFor(languageCode);
    final note = letter.noteFor(languageCode);
    final chipLabel = letter.isAvailable
        ? l10n.profileLettersStatusLive
        : l10n.profileLettersStatusPending;

    final pendingBackground = theme.colorScheme.surfaceContainerHighest;
    final pendingForeground = theme.colorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    letter.partner,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    letter.role,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: letter.isAvailable
                    ? theme.colorScheme.primaryContainer
                    : pendingBackground,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                chipLabel,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: letter.isAvailable
                      ? theme.colorScheme.onPrimaryContainer
                      : pendingForeground,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(summary),
        if (note != null) ...[
          const SizedBox(height: 8),
          Text(
            note,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: letter.isAvailable
              ? () => ProfileScreen._launchUrl(letter.url!)
              : null,
          icon: const Icon(Icons.description_outlined),
          label: Text(
            letter.isAvailable
                ? l10n.profileLettersOpenCta
                : l10n.profileLettersPendingLabel,
          ),
        ),
      ],
    );
  }
}
