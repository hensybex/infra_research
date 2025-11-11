// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';
import '../../widgets/neo_bullet_item.dart';

class OperatingModelSlide extends FlutterDeckSlide {
  OperatingModelSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/operating-model',
          title: 'Модель работы',
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
                    'Как мы работаем: оркестратор + продакт → дисциплина и скорость',
              ),
              const SizedBox(height: 24),
              Row(
                children: <Widget>[
                  Expanded(
                    child: _OperatingCard(
                      title: 'Ритм работы',
                      lines: const <String>[
                        'Ежедневные асинхронные утренние планёрки.',
                        'Еженедельные встречи по дорожной карте.',
                        'Ежемесячные демонстрации для руководства с ключевыми показателями.',
                      ],
                      icon: Icons.calendar_month,
                      visible: step >= 1,
                      delay: 0.ms,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _OperatingCard(
                      title: 'Расширенная команда',
                      lines: const <String>[
                        'Дизайнер и юрист подключаются точечно на этапах Фундамент/Пилоты.',
                        'Менеджеры партнёрского блока проверяют сценарии и витрину.', // Источник: slides/slide13.md
                      ],
                      icon: Icons.group,
                      visible: step >= 1,
                      delay: 120.ms,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _OperatingCard(
                      title: 'Инструменты',
                      lines: const <String>[
                        'Оркестратор MCP, векторные базы знаний, централизованный агентный рабочий процесс GitHub Agent HQ.',
                        'DuckDB и Snowflake, полный стек наблюдаемости.', // Источник: slides/slide13.md
                      ],
                      icon: Icons.build_circle,
                      visible: step >= 1,
                      delay: 240.ms,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AnimatedOpacity(
                opacity: step >= 2 ? 1 : 0,
                duration: 360.ms,
                child: _BeforeAfterRow(
                  before:
                      'До: 20 инженеров без продуктового партнёра = хаос дедлайнов, узкое горлышко коммуникаций.', // Источник: slides/slide13.md
                  after:
                      'После: продакт ведёт исследования, синхронизирует стейкхолдеров, инженер держит несколько агентных сессий параллельно → бесшовная поставка.', // Источник: slides/slide13.md
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OperatingCard extends StatelessWidget {
  const _OperatingCard({
    required this.title,
    required this.lines,
    required this.icon,
    required this.visible,
    required this.delay,
  });

  final String title;
  final List<String> lines;
  final IconData icon;
  final bool visible;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!visible) {
      return const SizedBox.shrink();
    }

    return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: NeoColors.primary.neoOpacity(0.28)),
            gradient: const LinearGradient(
              colors: <Color>[Color(0x33251149), Color(0x11251149)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon, color: NeoColors.accent),
              const SizedBox(height: 12),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              for (final line in lines) ...<Widget>[
                NeoBulletItem(
                  text: line,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: NeoColors.textSecondary,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 360.ms, delay: delay)
        .moveY(begin: 14, end: 0, curve: Curves.easeOut);
  }
}

class _BeforeAfterRow extends StatelessWidget {
  const _BeforeAfterRow({required this.before, required this.after});

  final String before;
  final String after;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: NeoColors.primary.neoOpacity(0.28)),
            gradient: const LinearGradient(
              colors: <Color>[Color(0x3318133C), Color(0x1118133C)],
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'До',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: NeoColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      before,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: NeoColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Icon(Icons.east, color: NeoColors.accent),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'После',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      after,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: NeoColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 360.ms)
        .moveY(begin: 14, end: 0, curve: Curves.easeOut);
  }
}
