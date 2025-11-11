// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_badge.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class DuoSlide extends FlutterDeckSlide {
  DuoSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/duo',
          title: 'Команда',
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
                title: 'Штурм ведёт дуэт инженера и продакта',
                subtitle:
                    'Компактная команда, которая даёт скорость крупного облачного провайдера без накладных расходов большой студии.',
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: _RoleCard(
                        title: 'Инженер-архитектор',
                        bulletLines: const <String>[
                          'Оркестрирует мульти-агентные пайплайны: MCP-серверы, агентные среды, базы знаний.', // Источник: slides/slide03.md
                          'Практикует архитектурные подходы уровня OpenAI / Google с Cursor, Copilot Studio, Codex — современными агентными IDE (инструментами разработки).', // Источник: slides/slide03.md
                          'Берёт на себя серверную часть, процессы внедрения и эксплуатации (DevOps), наблюдаемость, интеграции, аналитику, веб- и мобильные интерфейсы.', // Источник: slides/slide03.md
                        ],
                        icon: Icons.memory,
                        visible: step >= 1,
                        delay: 0.ms,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _RoleCard(
                        title: 'Продакт-партнёр',
                        bulletLines: const <String>[
                          'Отвечает за рынок, продвижение, соответствие требованиям и работу с дружественными юрисдикциями.', // Источник: slides/slide03.md
                          'Организует исследования, формирует дорожную карту, следит за метриками и сроками, держит инженера в ритме.', // Источник: slides/slide03.md
                          'Проводит ритуалы: еженедельные синки, отчёты для руководства, согласование с стейкхолдерами.', // Источник: slides/slide03.md
                        ],
                        icon: Icons.auto_awesome,
                        visible: step >= 2,
                        delay: 140.ms,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: step >= 1 ? 1 : 0,
                duration: 360.ms,
                child: Text(
                  'Console Copilot — внутренняя консоль для инженеров, которую дуэт развивает как единый пульт управления.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: NeoColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: step >= 3 ? 1 : 0,
                duration: 360.ms,
                child: const NeoBadge(
                  label:
                      'Дуэт → результат: скорость крупного облачного провайдера без лишних ресурсов',
                  icon: Icons.link,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.title,
    required this.bulletLines,
    required this.icon,
    required this.visible,
    required this.delay,
  });

  final String title;
  final List<String> bulletLines;
  final IconData icon;
  final bool visible;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!visible) {
      return const SizedBox.shrink();
    }

    final TextStyle? baseTitleStyle = theme.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
    );
    final TextStyle? scaledTitleStyle = baseTitleStyle?.copyWith(
      fontSize: baseTitleStyle.fontSize != null
          ? baseTitleStyle.fontSize! * (1.5 / 1.5)
          : null,
    );

    final TextStyle? baseBulletStyle = theme.textTheme.bodyMedium?.copyWith(
      color: NeoColors.textSecondary,
      height: 1.5,
    );
    final TextStyle? scaledBulletStyle = baseBulletStyle?.copyWith(
      fontSize: baseBulletStyle.fontSize != null
          ? baseBulletStyle.fontSize! * (2 / 1.5)
          : null,
    );

    return Container(
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: NeoColors.primary.neoOpacity(0.3)),
            color: NeoColors.surface.neoOpacity(0.55),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Center(child: Icon(icon, color: NeoColors.primary)),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: scaledTitleStyle,
                ),
              ),
              const SizedBox(height: 16),
              if (bulletLines.isNotEmpty)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for (final bullet in bulletLines) ...<Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              '— ',
                              style: TextStyle(
                                color: NeoColors.accent,
                                fontSize: 36 / 1.5,
                              ),
                            ),
                            Expanded(
                              child: Text(bullet, style: scaledBulletStyle),
                            ),
                          ],
                        ),
                        if (bullet != bulletLines.last)
                          const SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 420.ms, delay: delay)
        .moveY(begin: 18, end: 0, curve: Curves.easeOut);
  }
}
