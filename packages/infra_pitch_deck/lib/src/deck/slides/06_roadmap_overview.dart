// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';
import '../../widgets/neo_timeline.dart';

class RoadmapOverviewSlide extends FlutterDeckSlide {
  RoadmapOverviewSlide({super.key})
    : super.template(
        configuration: FlutterDeckSlideConfiguration(
          route: '/roadmap-overview',
          title: 'Маршрут',
          steps: _entries.length + 1,
        ),
        contentBuilder: _build,
      );

  static final List<_PhaseMetrics> _metrics = <_PhaseMetrics>[
    _PhaseMetrics(
      phase: 'Разогрев',
      details:
          '70 % инцидентов покрываем краткими сводками Console Copilot.', // Источник: slides/slide06.md
    ),
    _PhaseMetrics(
      phase: 'Фундамент',
      details:
          '3 партнёра подключены, чек-лист резидентности закрыт на 80 %.', // Источник: slides/slide06.md
    ),
    _PhaseMetrics(
      phase: 'Пилоты',
      details:
          '50 % регламентных задач автоматизировано, индекс удовлетворённости партнёров ≥ 8.', // Источник: slides/slide06.md
    ),
    _PhaseMetrics(
      phase: 'Масштабирование',
      details:
          'Среднее время восстановления ↓40 %, 20+ предложений в работе, аудит ≤ 5 дней.', // Источник: slides/slide06.md
    ),
  ];

  static final List<NeoTimelineEntry> _entries = <NeoTimelineEntry>[
    NeoTimelineEntry(
      phase: 'Разогрев (0–4 недели)',
      timeframe: 'Подключаем, финализируем',
      highlights: <String>[
        'Телеметрия и биллинг подключены в режиме чтения.',
        'Console Copilot (операторская консоль) работает в режиме наблюдения.',
        'Правила витрины и доверия согласованы.',
      ],
    ),
    NeoTimelineEntry(
      phase: 'Фундамент (1–3 месяцы)',
      timeframe: 'Запускаем процессы',
      highlights: <String>[
        'Console Copilot выполняет регламенты, запускаем Штаб инцидентов.',
        'Пусковая площадка витрины и первые пакеты решений.',
        'Витрина доверия получает первые подтверждения контроля.',
      ],
    ),
    NeoTimelineEntry(
      phase: 'Пилоты (3–6 месяцев)',
      timeframe: 'Расширяем автоматизацию',
      highlights: <String>[
        'Управляемая автоматизация и партнёрские песочницы.',
        'Витрина доверия в работе, помощник по биллингу в продакшене.',
        'Собираем отзывы партнёров, усиливаем сценарии безопасности.',
      ],
    ),
    NeoTimelineEntry(
      phase: 'Масштабирование (6–12 месяцев)',
      timeframe: 'Закрепляем эффект',
      highlights: <String>[
        'Комплекс безопасности и сценарии наблюдаемости.',
        'Вертикальные пакеты решений и аналитика по соответствию требованиям.',
        'Полноценное использование витрины и партнёров из дружественных стран.',
      ],
    ),
  ];

  static Widget _build(BuildContext context) {
    final theme = Theme.of(context);

    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          final revealed = step.clamp(0, _entries.length);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoHeadline(
                title:
                    'Четыре фазы внедрения: Разогрев → Фундамент → Пилоты → Масштабирование',
              ),
              const SizedBox(height: 28),
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            NeoTimeline(
                              entries: _entries,
                              activeIndex: revealed > 0 ? revealed - 1 : null,
                              revealedCount: revealed,
                            ),
                            const SizedBox(height: 24),
                            AnimatedOpacity(
                              opacity: step >= _entries.length ? 1 : 0,
                              duration: 360.ms,
                              child:
                                  Container(
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        color: NeoColors.primary.neoOpacity(
                                          0.3,
                                        ),
                                      ),
                                      gradient: const LinearGradient(
                                        colors: <Color>[
                                          Color(0x3329104F),
                                          Color(0x1129104F),
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Ключевые метрики по фазам',
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                        const SizedBox(height: 12),
                                        for (final metric
                                            in _metrics) ...<Widget>[
                                          _MetricRow(metric: metric),
                                          const SizedBox(height: 10),
                                        ],
                                      ],
                                    ),
                                  ).animate().moveY(
                                    begin: 16,
                                    end: 0,
                                    duration: 360.ms,
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

class _PhaseMetrics {
  const _PhaseMetrics({required this.phase, required this.details});

  final String phase;
  final String details;
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.metric});

  final _PhaseMetrics metric;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.flag, color: NeoColors.accent.neoOpacity(0.9)),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: NeoColors.textSecondary,
                height: 1.5,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: '${metric.phase}: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: NeoColors.textPrimary,
                  ),
                ),
                TextSpan(text: metric.details),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
