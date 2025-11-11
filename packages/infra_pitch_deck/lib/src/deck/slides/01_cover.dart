// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_badge.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class CoverSlide extends FlutterDeckSlide {
  CoverSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/cover',
          title: 'Старт',
          initial: true,
          steps: 3,
          header: FlutterDeckHeaderConfiguration(showHeader: false),
          footer: FlutterDeckFooterConfiguration(showFooter: false),
          showProgress: false,
          transition: FlutterDeckTransition.fade(),
        ),
        contentBuilder: _build,
      );

  static Widget _build(BuildContext context) {
    final theme = Theme.of(context);

    return NeoSlideScaffold(
      enableOrbits: true,
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          final showHeadline = step >= 2;
          final showCallToAction = step >= 3;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoBadge(
                    label: 'Инженер + продакт • мульти-оркестраторный дуэт',
                    icon: Icons.bolt,
                  )
                  .animate(target: step >= 1 ? 1 : 0)
                  .fadeIn(duration: 400.ms)
                  .moveY(begin: 16, end: 0, curve: Curves.easeOut),
              const Spacer(flex: 3),
              AnimatedOpacity(
                opacity: showHeadline ? 1 : 0,
                duration: 420.ms,
                child: const NeoHeadline(
                  title: 'Штурмуем инфраструктуру за год',
                  subtitle:
                      'Мульти-оркестраторный дуэт инженер + продакт • 12-месячный контракт',
                ),
              ),
              const Spacer(flex: 2),
              AnimatedOpacity(
                opacity: showCallToAction ? 1 : 0,
                duration: 420.ms,
                child: Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: NeoColors.primary.neoOpacity(0.35),
                    ),
                    gradient: const LinearGradient(
                      colors: <Color>[Color(0x3329104F), Color(0x1129104F)],
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.rocket_launch, color: NeoColors.accent),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Старт подготовительного этапа («Фаза 0») в течение 2 недель после согласования → собираем инфраструктурный контур ИИ под ключ.',
                          style: theme.textTheme.titleMedium?.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().moveY(begin: 24, end: 0, duration: 420.ms),
              ),
              const Spacer(flex: 4),
            ],
          );
        },
      ),
    );
  }
}
