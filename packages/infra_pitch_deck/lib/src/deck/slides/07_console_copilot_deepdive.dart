// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_metric_card.dart';
import '../../widgets/neo_slide_scaffold.dart';

class ConsoleCopilotDeepdiveSlide extends FlutterDeckSlide {
  ConsoleCopilotDeepdiveSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/console-copilot',
          title: 'Console Copilot',
          steps: 3,
        ),
        contentBuilder: _build,
      );

  static Widget _build(BuildContext context) {
    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoHeadline(
                title:
                    'Console Copilot — центр управления полётами для команд эксплуатации',
              ),
              const SizedBox(height: 20),
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final Widget metricsColumn = Column(
                      children: <Widget>[
                        NeoMetricCard(
                          metric: '−40 %',
                          caption: 'MTTR к фазе «Масштабирование»',
                          description:
                              'Среднее время восстановления снижается за счёт автоматизации инцидентов.', // Источник: slides/slide07.md
                          icon: Icons.timer,
                          delay: const Duration(milliseconds: 0),
                          tight: true,
                        ),
                        const SizedBox(height: 12),
                        NeoMetricCard(
                          metric: '70 %',
                          caption: 'Инцидентов с автосводкой',
                          description:
                              'На этапе «Фундамент» Console Copilot генерирует краткие сводки и план действий автоматически.', // Источник: slides/slide07.md
                          icon: Icons.description,
                          delay: const Duration(milliseconds: 140),
                          tight: true,
                        ),
                        const SizedBox(height: 12),
                        NeoMetricCard(
                          metric: '100 %',
                          caption: 'Прозрачность для витрины доверия',
                          description:
                              'Инциденты фиксируются в витрине доверия — публичной странице доверия — и доступны аудиторам.', // Источник: slides/slide07.md
                          icon: Icons.visibility,
                          delay: const Duration(milliseconds: 240),
                          tight: true,
                        ),
                      ],
                    );

                    final List<Widget> rowChildren = <Widget>[
                      Flexible(
                        flex: 6,
                        fit: FlexFit.loose,
                        child: _CopilotFlow(step: step),
                      ),
                      const SizedBox(width: 28),
                      Flexible(
                        flex: 4,
                        fit: FlexFit.loose,
                        child: metricsColumn,
                      ),
                    ];

                    final row = Row(children: rowChildren);

                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: row,
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

class _CopilotFlow extends StatelessWidget {
  const _CopilotFlow({required this.step});

  final int step;

  @override
  Widget build(BuildContext context) {
    final items = <_FlowStage>[
      _FlowStage(
        title: '1. Слежение',
        description:
            'Подключаемся к журналам, метрикам, биллингу; формируем базу знаний по сценариям и инцидентам.', // Источник: slides/slide07.md
      ),
      _FlowStage(
        title: '2. Подсказки',
        description:
            'Собираем историю инцидента, подсвечиваем сценарий действий, предлагаем ответственных.', // Источник: slides/slide07.md
      ),
      _FlowStage(
        title: '3. Исполнение',
        description:
            'Запускаем проверенные сценарии через оркестратор, фиксируем результат и готовим отчёт.', // Источник: slides/slide07.md
      ),
    ];

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool boundedHeight = constraints.hasBoundedHeight;
        final tileBuilder = <Widget>[];

        for (int index = 0; index < items.length; index++) {
          final tile = _FlowTile(
            stage: items[index],
            highlighted: step >= index + 1,
            delay: Duration(milliseconds: 140 * index),
            showConnector: index != items.length - 1 && boundedHeight,
          );

          if (boundedHeight) {
            tileBuilder.add(Expanded(child: tile));
            if (index != items.length - 1) {
              tileBuilder.add(const SizedBox(height: 8));
            }
          } else {
            tileBuilder.add(tile);
            if (index != items.length - 1) {
              tileBuilder.add(const SizedBox(height: 12));
            }
          }
        }

        if (boundedHeight) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: tileBuilder,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: tileBuilder,
        );
      },
    );
  }
}

class _FlowStage {
  const _FlowStage({required this.title, required this.description});

  final String title;
  final String description;
}

class _FlowTile extends StatelessWidget {
  const _FlowTile({
    required this.stage,
    required this.highlighted,
    required this.delay,
    required this.showConnector,
  });

  final _FlowStage stage;
  final bool highlighted;
  final Duration delay;
  final bool showConnector;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: NeoColors.primary.neoOpacity(highlighted ? 0.35 : 0.18),
            ),
            color: NeoColors.surface.neoOpacity(highlighted ? 0.55 : 0.3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                stage.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: highlighted
                      ? NeoColors.textPrimary
                      : NeoColors.neutral,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                stage.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: NeoColors.textSecondary,
                  height: 1.4,
                ),
              ),
              if (showConnector) ...[
                const SizedBox(height: 8),
                Divider(
                  height: 1,
                  color: NeoColors.primary.neoOpacity(0.18),
                  thickness: 1,
                ),
              ],
            ],
          ),
        )
        .animate(target: highlighted ? 1 : 0)
        .fadeIn(duration: 360.ms, delay: delay)
        .moveY(begin: 14, end: 0, curve: Curves.easeOut);
  }
}
