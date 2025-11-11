import 'package:flutter/material.dart';
import 'package:infra_pitch_deck/infra_pitch_deck.dart';
import 'package:infra/l10n/app_localizations.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          const InfraPitchDeck(),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton.icon(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.close),
                  label: Text(l10n.presentationCloseCta),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
