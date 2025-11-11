// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class WhyNowSlide extends FlutterDeckSlide {
  WhyNowSlide({super.key})
    : super.template(
        configuration: FlutterDeckSlideConfiguration(
          route: '/why-now',
          title: 'Почему сейчас',
          steps: _points.length,
        ),
        contentBuilder: _build,
      );

  static const List<_WhyNowPoint> _points = <_WhyNowPoint>[
    _WhyNowPoint(
      title:
          'Selectel прибавляет +46 % к выручке и уже объявил 10 млрд ₽ инвестиций в инфраструктуру ИИ — рынок тратит деньги на суверенные решения прямо сейчас.',
      icon: Icons.trending_up,
      // Источник: slides/slide02.md
    ),
    _WhyNowPoint(
      title:
          'Meta удваивает вложения в ИИ до \$70–72 млрд, задавая темп всем облачным игрокам; Timeweb Cloud и другие российские провайдеры выводят своих агентов искусственного интеллекта с поддержкой OpenAI, Gemini и другими премиальными моделями.',
      icon: Icons.cloud,
      // Источник: slides/slide02.md
    ),
    _WhyNowPoint(
      title:
          'Правительство Южной Кореи утверждает многотриллионный «бюджет ИИ» и называет инфраструктуру искусственного интеллекта вопросом национального выживания — тренд глобальный.',
      icon: Icons.public,
      // Источник: slides/slide02.md
    ),
    _WhyNowPoint(
      title:
          'AWS внедряет «умные» ограничения на ответы ИИ, которые заранее проверяют качество и соответствие требованиям, значит клиенты ожидают формальные гарантии и прозрачность.',
      icon: Icons.verified_user,
      // Источник: slides/slide02.md
    ),
    _WhyNowPoint(
      title:
          'Чтобы конкурировать в России, нужно одновременно держать данные в стране и уметь подключать лучшие мировые модели — без этой комбинации витрина проиграет.',
      icon: Icons.sync_alt,
      // Источник: slides/slide02.md
    ),
  ];

  static Widget _build(BuildContext context) {
    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          final revealed = step.clamp(0, _points.length);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoHeadline(
                title: 'Почему инфраструктуре нужен рывок в области ИИ в 2025',
                subtitle:
                    'Глобальные провайдеры и государства уже инвестируют — локальным игрокам нужна связка «суверенность + premium модели».',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final List<_WhyNowPoint> visiblePoints = _points
                        .take(revealed)
                        .toList();
                    if (visiblePoints.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    final bool fullyRevealed = revealed >= _points.length;
                    final bool isTwoColumn = constraints.maxWidth >= 1480;
                    final double horizontalGap = isTwoColumn ? 24 : 0;
                    final double tileWidth = isTwoColumn
                        ? (constraints.maxWidth - horizontalGap) / 2
                        : constraints.maxWidth;

                    return Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        child: Wrap(
                          spacing: horizontalGap,
                          runSpacing: 16,
                          children: <Widget>[
                            for (
                              int index = 0;
                              index < visiblePoints.length;
                              index++
                            )
                              SizedBox(
                                width: tileWidth,
                                child: _WhyNowTile(
                                  point: visiblePoints[index],
                                  show: true,
                                  dimmed:
                                      index == visiblePoints.length - 1 &&
                                      !fullyRevealed,
                                  delay: Duration(milliseconds: 120 * index),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WhyNowPoint {
  const _WhyNowPoint({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

class _WhyNowTile extends StatelessWidget {
  const _WhyNowTile({
    required this.point,
    required this.show,
    required this.dimmed,
    required this.delay,
  });

  final _WhyNowPoint point;
  final bool show;
  final bool dimmed;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: NeoColors.primary.neoOpacity(dimmed ? 0.18 : 0.4),
            ),
            color: NeoColors.surface.neoOpacity(dimmed ? 0.3 : 0.55),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                point.icon,
                color: dimmed ? NeoColors.neutral : NeoColors.accent,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AutoSizeText(
                  point.title,
                  minFontSize: 14,
                  maxLines: 6,
                  stepGranularity: 0.5,
                  style:
                      theme.textTheme.bodyLarge?.copyWith(
                        color: NeoColors.textPrimary,
                        height: 1.38,
                      ) ??
                      TextStyle(
                        color: NeoColors.textPrimary,
                        fontSize: 18,
                        height: 1.38,
                      ),
                ),
              ),
            ],
          ),
        )
        .animate(target: show ? 1 : 0)
        .fadeIn(duration: 360.ms, delay: delay)
        .moveY(begin: 14, end: 0, curve: Curves.easeOut);
  }
}
