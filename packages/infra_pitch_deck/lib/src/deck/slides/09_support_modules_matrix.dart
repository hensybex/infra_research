// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';
import '../../widgets/neo_bullet_item.dart';

class SupportModulesMatrixSlide extends FlutterDeckSlide {
  SupportModulesMatrixSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/support-modules',
          title: 'Модули поддержки',
          steps: 4,
        ),
        contentBuilder: _build,
      );

  static final List<_Cluster> _clusters = <_Cluster>[
    _Cluster(
      name: 'Операции',
      items: <String>[
        'Студия сценариев',
        'Инцидентный помощник',
        'Монитор жизненного цикла активов',
        'Аналитика обратной связи',
      ],
    ),
    _Cluster(
      name: 'Рост витрины',
      items: <String>[
        'Панель доходов партнёров',
        'Помощник по запуску для разработчиков',
        'Отраслевые пакеты',
        'Витрина доверия',
      ],
    ),
    _Cluster(
      name: 'Соответствие требованиям и безопасность',
      items: <String>[
        'Советник по правилам',
        'Хранилище доказательств соответствия',
        'Набор инструментов для суверенных данных',
        'Агент плана безопасности',
      ],
    ),
    _Cluster(
      name: 'Экосистема и голос',
      items: <String>[
        'Голосовой помощник эксплуатации',
        'Навигатор по внедрению ИИ',
        'Граф знаний сообщества',
        'Трекер программы резидентов',
      ],
    ),
  ];

  static Widget _build(BuildContext context) {
    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          final activeIndex = (step - 1).clamp(0, _clusters.length - 1);
          final revealCount = step.clamp(0, _clusters.length);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoHeadline(
                title: 'От консоли до роста: 4 кластера модулей ИИ',
                subtitle:
                    '30 решений готовы подключаться по мере роста — каждое ложится в структуру суперприложения и усиливает главную цель.',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  children: <Widget>[
                    for (
                      int index = 0;
                      index < _clusters.length;
                      index++
                    ) ...<Widget>[
                      Expanded(
                        child: LayoutBuilder(
                          builder:
                              (
                                BuildContext context,
                                BoxConstraints constraints,
                              ) {
                                final double cardHeight = constraints.maxHeight;

                                return Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: cardHeight,
                                    child: _ClusterCard(
                                      cluster: _clusters[index],
                                      highlighted:
                                          index == activeIndex && step > 0,
                                      visible: index < revealCount,
                                    ),
                                  ),
                                );
                              },
                        ),
                      ),
                      if (index != _clusters.length - 1)
                        const SizedBox(width: 20),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Cluster {
  const _Cluster({required this.name, required this.items});

  final String name;
  final List<String> items;
}

class _ClusterCard extends StatelessWidget {
  const _ClusterCard({
    required this.cluster,
    required this.highlighted,
    required this.visible,
  });

  final _Cluster cluster;
  final bool highlighted;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!visible) {
      return const SizedBox.shrink();
    }

    final double titleFontSize =
        (theme.textTheme.titleLarge?.fontSize ?? 24) * 1.2;
    final double itemFontSize =
        (theme.textTheme.bodyMedium?.fontSize ?? 16) * 1.2;

    return Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: NeoColors.primary.neoOpacity(highlighted ? 0.35 : 0.18),
              width: highlighted ? 2 : 1,
            ),
            gradient: LinearGradient(
              colors: <Color>[
                NeoColors.primary.neoOpacity(highlighted ? 0.25 : 0.08),
                Colors.transparent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoSizeText(
                cluster.name,
                maxLines: 1,
                minFontSize: 18,
                overflowReplacement: Text(
                  cluster.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: titleFontSize,
                  ),
                ),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: titleFontSize,
                ),
              ),
              const SizedBox(height: 16),
              for (final item in cluster.items) ...<Widget>[
                NeoBulletItem(
                  text: item,
                  icon: Icons.check_circle,
                  bulletSize: 18,
                  bulletColor: highlighted
                      ? NeoColors.accent
                      : NeoColors.neutral,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: NeoColors.textSecondary,
                    fontSize: itemFontSize,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 360.ms)
        .moveY(begin: 14, end: 0, curve: Curves.easeOutBack);
  }
}
