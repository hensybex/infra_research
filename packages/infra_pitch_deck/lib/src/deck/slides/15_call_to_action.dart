// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_badge.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class CallToActionSlide extends FlutterDeckSlide {
  CallToActionSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/cta',
          title: 'Призыв к действию',
          steps: 2,
          header: FlutterDeckHeaderConfiguration(showHeader: false),
          footer: FlutterDeckFooterConfiguration(showFooter: false),
          showProgress: false,
        ),
        contentBuilder: _build,
      );

  static Widget _build(BuildContext context) {
    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          final showDetails = step >= 2;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(flex: 2),
              const NeoHeadline(title: 'Готовы стартовать'),
              const Spacer(),
              AnimatedOpacity(
                opacity: showDetails ? 1 : 0,
                duration: 360.ms,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      _CtaLine(
                        title: 'Шаг 1',
                        description:
                            'Фиксируем исходные показатели и доступы (недельный рабочий семинар).', // Источник: slides/slide15.md
                      ),
                      SizedBox(height: 12),
                      _CtaLine(
                        title: 'Шаг 2',
                        description:
                            'Подготовительный этап запускается в течение 2 недель после подписания.', // Источник: slides/slide15.md
                      ),
                      SizedBox(height: 12),
                      _CtaLine(
                        title: 'Шаг 3',
                        description:
                            'Ежемесячные демонстрации для руководства и обновления витрины доверия для стейкхолдеров.', // Источник: slides/slide15.md
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Контакт: [email placeholder] • Готовы подключиться к вашему стеку в Google Cloud Platform (GCP), Amazon Web Services (AWS) или на локальной инфраструктуре.',
                      ),
                    ],
                  ),
                ).animate().moveY(begin: 18, end: 0, duration: 360.ms),
              ),
              const Spacer(),
              AnimatedOpacity(
                opacity: showDetails ? 1 : 0,
                duration: 360.ms,
                child: Row(
                  children: <Widget>[
                    const _PulseButton(),
                    const SizedBox(width: 16),
                    const NeoBadge(
                      label: 'Ссылка на лендинг Риты',
                      icon: Icons.link,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}

class _CtaLine extends StatelessWidget {
  const _CtaLine({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$title:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: NeoColors.textSecondary,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _PulseButton extends StatelessWidget {
  const _PulseButton();

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: <Color>[NeoColors.primary, NeoColors.secondary],
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: NeoColors.primary.neoOpacity(0.4),
                blurRadius: 24,
                spreadRadius: 4,
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            icon: const Icon(Icons.play_arrow, color: Colors.black),
            label: const Text(
              'Запустить проект',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
        .animate(
          onPlay: (AnimationController controller) =>
              controller.repeat(reverse: true),
        )
        .scale(
          begin: const Offset(0.97, 0.97),
          end: const Offset(1.03, 1.03),
          duration: 900.ms,
          curve: Curves.easeInOut,
        );
  }
}
