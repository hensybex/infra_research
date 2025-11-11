// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';
import '../../widgets/neo_bullet_item.dart';

class PartnerHubSuperappSlide extends FlutterDeckSlide {
  PartnerHubSuperappSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/partner-hub',
          title: 'Партнёрская суперструктура',
          steps: 4,
        ),
        contentBuilder: _build,
      );

  static Widget _build(BuildContext context) {
    final theme = Theme.of(context);

    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoHeadline(
                title:
                    'Суперструктура: Console Copilot (операторская консоль) для операторов + Партнёрский центр для рынка',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: _PanelCard(
                        title:
                            'Операторы (Console Copilot — операторская консоль)',
                        items: const <String>[
                          'Штаб инцидентов',
                          'Радар аномалий затрат',
                          'Панель наблюдаемости',
                          'Помощник по безопасности',
                        ],
                        icon: Icons.hub,
                        highlighted: step >= 2,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _PanelCard(
                        title: 'Партнёры (Партнёрский центр)',
                        items: const <String>[
                          'Пусковая площадка витрины',
                          'Оркестратор песочниц партнёров',
                          'Оценка качества и отзывы',
                          'Отраслевые пакеты и витрина доверия',
                        ],
                        icon: Icons.groups,
                        highlighted: step >= 3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: step >= 4 ? 1 : 0,
                duration: 360.ms,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: NeoColors.primary.neoOpacity(0.28),
                    ),
                    gradient: const LinearGradient(
                      colors: <Color>[Color(0x332C1150), Color(0x112C1150)],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Общие сервисы',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const _CommonServiceRow(
                        icon: Icons.gavel,
                        text:
                            'Контур соответствия 152‑ФЗ: локализация, оценка влияния, уведомления Роскомнадзора.', // Источник: slides/slide08.md
                      ),
                      const SizedBox(height: 8),
                      const _CommonServiceRow(
                        icon: Icons.storage,
                        text:
                            'Хранилище телеметрии и биллинга: единый источник данных для ИИ и аналитики.', // Источник: slides/slide08.md
                      ),
                      const SizedBox(height: 8),
                      const _CommonServiceRow(
                        icon: Icons.vpn_key,
                        text:
                            'Управление учётными записями и доступами: личные кабинеты резидентов и режим для партнёров из дружественных стран.', // Источник: slides/slide08.md
                      ),
                    ],
                  ),
                ).animate().moveY(begin: 16, end: 0, duration: 360.ms),
              ),
              const SizedBox(height: 16),
              Text(
                'Две оболочки → один технологический контур. Операторы и партнёры работают в своих сценариях, но всё управляется единым оркестрационным ядром.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: NeoColors.textSecondary,
                  height: 1.45,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PanelCard extends StatelessWidget {
  const _PanelCard({
    required this.title,
    required this.items,
    required this.icon,
    required this.highlighted,
  });

  final String title;
  final List<String> items;
  final IconData icon;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isWide = constraints.maxWidth >= 520;
        final double runSpacing = 12;
        final double spacing = isWide ? 20 : 0;
        final double bulletWidth = isWide
            ? (constraints.maxWidth - spacing) / 2
            : constraints.maxWidth;

        return Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: NeoColors.primary.neoOpacity(
                    highlighted ? 0.35 : 0.18,
                  ),
                ),
                gradient: const LinearGradient(
                  colors: <Color>[Color(0x33251149), Color(0x11251149)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: highlighted ? NeoColors.accent : NeoColors.neutral,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: Wrap(
                        spacing: spacing,
                        runSpacing: runSpacing,
                        children: <Widget>[
                          for (final String item in items)
                            SizedBox(
                              width: bulletWidth,
                              child: NeoBulletItem(
                                text: item,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: NeoColors.textSecondary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
            .animate(target: highlighted ? 1 : 0)
            .fadeIn(duration: 360.ms)
            .moveY(begin: 14, end: 0);
      },
    );
  }
}

class _CommonServiceRow extends StatelessWidget {
  const _CommonServiceRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon, color: NeoColors.accent),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: NeoColors.textSecondary,
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }
}
