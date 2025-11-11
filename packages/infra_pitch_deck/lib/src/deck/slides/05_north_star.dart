// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class NorthStarSlide extends FlutterDeckSlide {
  NorthStarSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/north-star',
          title: 'Цель',
          steps: 2,
        ),
        contentBuilder: _build,
      );

  static Widget _build(BuildContext context) {
    final theme = Theme.of(context);
    final breakpoints = ResponsiveBreakpoints.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints rootConstraints) {
        final bool compactHeight = rootConstraints.maxHeight < 860;
        final bool narrowWidth = breakpoints.smallerThan(DESKTOP);
        final double sectionSpacing = compactHeight ? 20 : 28;

        return NeoSlideScaffold(
          padding: EdgeInsets.symmetric(
            horizontal: narrowWidth ? 40 : 64,
            vertical: compactHeight ? 32 : 48,
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final bool enableScroll =
                  compactHeight || constraints.maxHeight < 760;

              Widget content = FlutterDeckSlideStepsBuilder(
                builder: (BuildContext context, int step) {
                  final bool showKpi = step >= 2;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const NeoHeadline(
                        title:
                            'Главная цель инфраструктурного провайдера на 12 месяцев',
                        subtitle:
                            'Console Copilot держит в тонусе команды эксплуатации, а суверенная витрина решений ИИ выводит партнёров на доверие и монетизацию.',
                      ),
                      SizedBox(height: sectionSpacing),
                      ResponsiveRowColumn(
                        layout: narrowWidth
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                        rowCrossAxisAlignment: CrossAxisAlignment.start,
                        columnCrossAxisAlignment: CrossAxisAlignment.stretch,
                        rowSpacing: 20,
                        columnSpacing: 16,
                        children: const <ResponsiveRowColumnItem>[
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: _PillarCard(
                              title: 'Console Copilot',
                              description:
                                  'Внутренний пульт для инженеров эксплуатации дата-центра: читает телеметрию, раскладывает инциденты и запускает проверенные регламенты без переключения между системами (см. DR2 Solution Pathing).', // Источник: slides/slide05.md
                              icon: Icons.hub,
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: _PillarCard(
                              title: 'Суверенная витрина решений ИИ',
                              description:
                                  'Витрина для резидентов и клиентов: инфраструктурщик публикует решения ИИ, ведёт песочницы и показывает доказательства доверия конечным заказчикам (см. notes/roadmap_draft.md).', // Источник: slides/slide05.md
                              icon: Icons.storefront,
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: _PillarCard(
                              title: 'Соответствие требованиям и аудит',
                              description:
                                  'Встроенные контуры 152‑ФЗ, уведомления Роскомнадзора и прозрачные журналы для аудиторов, собранные на базе Copilot + витрина доверия (см. BI_CATALOGUE.md).', // Источник: slides/slide05.md
                              icon: Icons.shield,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: sectionSpacing - 8),
                      Text(
                        'Copilot аккумулирует телеметрию и артефакты, которые переходят в витрину решений ИИ: так партнёры видят доказательства, а обратная связь витрины подсказывает, какие сценарии автоматизировать следующими (см. BI_CATALOGUE.md).',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: NeoColors.textSecondary,
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: sectionSpacing),
                      AnimatedOpacity(
                        opacity: showKpi ? 1 : 0,
                        duration: 360.ms,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: NeoColors.primary.neoOpacity(0.28),
                            ),
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color(0x332D174F),
                                Color(0x112D174F),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Ключевые показатели',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const _KpiLine(
                                icon: Icons.timer,
                                text:
                                    'Команды эксплуатации с Console Copilot снижают среднее время восстановления сервисов на 40 % за счёт автоматизированных регламентов (см. DR2 Solution Pathing).', // Источник: slides/slide05.md
                              ),
                              const SizedBox(height: 10),
                              const _KpiLine(
                                icon: Icons.local_fire_department,
                                text:
                                    'Партнёры витрины выводят 20+ предложений ИИ, а подключение резидента занимает < 10 дней благодаря эталонному процессу и песочницам (см. notes/roadmap_draft.md).', // Источник: slides/slide05.md
                              ),
                              const SizedBox(height: 10),
                              const _KpiLine(
                                icon: Icons.verified_user,
                                text:
                                    'Витрина доверия собирает аудиторский пакет ≤ 5 дней, потому что Copilot автоматически протоколирует инциденты и передаёт артефакты в витрину решений ИИ (см. BI_CATALOGUE.md).', // Источник: slides/slide05.md
                              ),
                            ],
                          ),
                        ).animate().moveY(begin: 18, end: 0, duration: 360.ms),
                      ),
                    ],
                  );
                },
              );

              if (enableScroll) {
                content = SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: content,
                  ),
                );
              }

              return content;
            },
          ),
        );
      },
    );
  }
}

class _PillarCard extends StatelessWidget {
  const _PillarCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.28)),
        gradient: const LinearGradient(
          colors: <Color>[Color(0x33251149), Color(0x11251149)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: NeoColors.accent),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: NeoColors.textSecondary,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _KpiLine extends StatelessWidget {
  const _KpiLine({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon, color: NeoColors.accent, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: NeoColors.textSecondary,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
