// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class PortfolioSnapshotsSlide extends FlutterDeckSlide {
  PortfolioSnapshotsSlide({super.key})
    : super.template(
        configuration: FlutterDeckSlideConfiguration(
          route: '/portfolio-snapshots',
          title: 'Портфельные кейсы',
          steps: _totalSteps,
        ),
        contentBuilder: _build,
      );

  static const List<_ProjectShowcase> _projectShowcases = <_ProjectShowcase>[
    _ProjectShowcase(
      title: 'Shveya — диспетчер сети швейных цехов',
      summary:
          'Офлайн-поставляем управляющий центр смен, зарплат и склада на Flutter desktop + Go backend.',
      icon: Icons.precision_manufacturing,
      snapshots: <_SnapshotEntry>[
        _SnapshotEntry(
          label: 'Центр управления сменами',
          caption:
              'Администратор видит загрузку всех цехов и быстро пересобирает маршруты производства.', // Источник: portfolio/shveya/shveya.md
          assetPath: 'assets/images/portfolio/shveya/shveya_control_room.png',
        ),
        _SnapshotEntry(
          label: 'Планировщик операций',
          caption:
              'Маршруты и статусы операций ведутся в одном окне с фильтрами по сменам и мастерам.', // Источник: portfolio/shveya/shveya.md
          assetPath: 'assets/images/portfolio/shveya/shveya_shift_planner.png',
        ),
        _SnapshotEntry(
          label: 'Расчёт зарплат',
          caption:
              'Система автоматизирует начисления, ночные смены и удержания, выводя контрольную панель.', // Источник: portfolio/shveya/shveya.md
          assetPath:
              'assets/images/portfolio/shveya/shveya_payroll_console.png',
        ),
        _SnapshotEntry(
          label: 'Склад в онлайне',
          caption:
              'Все остатки и движения материалов доступны без Excel, есть экспорт и контроль дефицита.', // Источник: portfolio/shveya/shveya.md
          assetPath:
              'assets/images/portfolio/shveya/shveya_inventory_dashboard.png',
        ),
      ],
    ),
    _ProjectShowcase(
      title: 'SoulWi — мобильный наставник по стресс-менеджменту',
      summary:
          'Go + Flutter экосистема: AI-диалоги, календарь практик и push-напоминания, которые удерживают команды в ресурсе.',
      icon: Icons.self_improvement,
      snapshots: <_SnapshotEntry>[
        _SnapshotEntry(
          label: 'Главный экран и оплата',
          caption:
              'Домашний экран держит фокус на ритуалах, paywall продаёт premium-практики.', // Источник: portfolio/soulwi/soulwi.md
          assetPath: 'assets/images/portfolio/soulwi/soulwi_main_home.png',
          secondaryAssetPath:
              'assets/images/portfolio/soulwi/soulwi_main_paywall.png',
          isVertical: true,
          secondaryIsVertical: true,
        ),
        _SnapshotEntry(
          label: 'Daily-ритуал',
          caption:
              'Прохождение практики разбито на пошаговый сценарий: вопросы, дыхание, резюме.', // Источник: portfolio/soulwi/soulwi.md
          assetPath: 'assets/images/portfolio/soulwi/soulwi_daily_focus.png',
          secondaryAssetPath:
              'assets/images/portfolio/soulwi/soulwi_daily_review.png',
          isVertical: true,
          secondaryIsVertical: true,
        ),
        _SnapshotEntry(
          label: 'ИИ-диалог',
          caption:
              'Поддерживаем stream-чаты: копирование, выделение, быстрые шеры внутри переписки.', // Источник: portfolio/soulwi/soulwi.md
          assetPath: 'assets/images/portfolio/soulwi/soulwi_dialog_thread.png',
          secondaryAssetPath:
              'assets/images/portfolio/soulwi/soulwi_dialog_toolbox.png',
          isVertical: true,
          secondaryIsVertical: true,
        ),
        _SnapshotEntry(
          label: 'Категории и сценарии',
          caption:
              'Категории покрывают бытовые и рабочие ситуации, каждая разворачивается в подробную программу.', // Источник: portfolio/soulwi/soulwi.md
          assetPath:
              'assets/images/portfolio/soulwi/soulwi_categories_grid.png',
          secondaryAssetPath:
              'assets/images/portfolio/soulwi/soulwi_categories_detail.png',
          isVertical: true,
          secondaryIsVertical: true,
        ),
      ],
    ),
    _ProjectShowcase(
      title: 'Philologists Paradise — сервис расшифровки лекций',
      summary:
          'Serverpod + Flutter платформа: STT, LLM-анализ цитат и интерактивный клиент для гуманитариев.',
      icon: Icons.menu_book,
      snapshots: <_SnapshotEntry>[
        _SnapshotEntry(
          label: 'Pipeline загрузки',
          caption:
              'Загрузка лекции и отслеживание стадий STT прямо из клиента без терминала.', // Источник: portfolio/phil/philologists_paradise.md
          assetPath: 'assets/images/portfolio/phil/phil_pipeline_overview.png',
        ),
        _SnapshotEntry(
          label: 'LLM-тэгирование',
          caption:
              'Двухшаговый LLM-процесс помечает сущности и темы, чтобы исследователи находили цитаты.', // Источник: portfolio/phil/philologists_paradise.md
          assetPath: 'assets/images/portfolio/phil/phil_llm_tagging.png',
        ),
        _SnapshotEntry(
          label: 'Редактор абзацев',
          caption:
              'Команда правит транскрипт, закрепляет цитаты и формирует подборки.', // Источник: portfolio/phil/philologists_paradise.md
          assetPath:
              'assets/images/portfolio/phil/phil_annotation_workspace.png',
        ),
        _SnapshotEntry(
          label: 'Поиск и экспорт',
          caption:
              'Встроенный поиск по корпусу и быстрый экспорт подборок в CSV/Markdown.', // Источник: portfolio/phil/philologists_paradise.md
          assetPath: 'assets/images/portfolio/phil/phil_search_console.png',
        ),
      ],
    ),
  ];

  static const _HeroShowcase _smyslHero = _HeroShowcase(
    title: 'Smysl — ИИ-разведчик управленческой аналитики',
    summary:
        'Флагман студии: генерация BI-каталогов, LLM-трассировка и ClickHouse-пайплайн без ручных отчётов.',
    assetPath: 'assets/images/portfolio/smysl/smysl_flagship.png',
    metrics: <_HeroMetric>[
      _HeroMetric(label: 'LLM-трассировка', value: '100% вызовов'),
      _HeroMetric(label: 'BI-каталоги', value: '48 сценариев'),
      _HeroMetric(label: 'Deploy time', value: '< 3 недели'),
    ],
  );

  static final int _smallProjectSteps = _projectShowcases.fold(
    0,
    (int sum, _ProjectShowcase project) => sum + project.snapshots.length,
  );

  static const int _heroSteps = 1;
  static int get _totalSteps => _smallProjectSteps + _heroSteps;

  static Widget _build(BuildContext context) {
    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          Widget content;

          if (step == 0) {
            content = const _PortfolioIntro();
          } else if (step <= _smallProjectSteps) {
            final (_ProjectShowcase project, int highlightIdx) =
                _resolveSmallProjectStep(step);
            content = _SmallProjectView(
              project: project,
              activeSnapshotIndex: highlightIdx,
            );
          } else {
            content = const _SmyslHeroView(hero: _smyslHero);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoHeadline(title: 'Что мы уже поставляем в таком ритме'),
              const SizedBox(height: 24),
              Expanded(child: content),
              const SizedBox(height: 16),
              Text(
                step <= _smallProjectSteps
                    ? 'Каждый кадр — рабочая поставка: переносим шаблоны без лишних экспериментов.'
                    : 'Smysl держим флагманом: переносим reconnaissance-модуль и BI-каталоги в первую очередь.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: NeoColors.textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static (_ProjectShowcase, int) _resolveSmallProjectStep(int step) {
    var remaining = step;

    for (final project in _projectShowcases) {
      if (remaining <= project.snapshots.length) {
        return (project, remaining - 1);
      }
      remaining -= project.snapshots.length;
    }

    final last = _projectShowcases.last;
    return (last, last.snapshots.length - 1);
  }
}

class _PortfolioIntro extends StatelessWidget {
  const _PortfolioIntro();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.25)),
        gradient: const LinearGradient(
          colors: <Color>[Color(0x3312132C), Color(0x1112132C)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Входим в портфель',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Дальше — три быстрых блока по текущим delivery-продуктам и выделенный hero для Smysl.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: NeoColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallProjectView extends StatelessWidget {
  const _SmallProjectView({
    required this.project,
    required this.activeSnapshotIndex,
  });

  final _ProjectShowcase project;
  final int activeSnapshotIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final snapshot = project.snapshots[activeSnapshotIndex];

    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: NeoColors.primary.neoOpacity(0.28)),
              gradient: const LinearGradient(
                colors: <Color>[Color(0x33181436), Color(0x11181436)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(project.icon, color: NeoColors.accent, size: 32),
                const SizedBox(height: 16),
                Text(
                  project.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  project.summary,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: NeoColors.textSecondary,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Акцент кадра',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: NeoColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                AnimatedSwitcher(
                  duration: 320.ms,
                  child: Column(
                    key: ValueKey<int>(activeSnapshotIndex),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snapshot.label,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        snapshot.caption,
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
          ).animate().fadeIn(duration: 360.ms).moveY(begin: 12),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 2,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final int splitIndex = (project.snapshots.length / 2)
                  .ceil()
                  .clamp(1, 3);
              final List<_SnapshotEntry> topRow = project.snapshots.sublist(
                0,
                splitIndex,
              );
              final List<_SnapshotEntry> bottomRow = project.snapshots.sublist(
                splitIndex,
              );

              Widget buildRow(List<_SnapshotEntry> entries, int baseIndex) {
                if (entries.isEmpty) {
                  return const Spacer();
                }

                return Expanded(
                  child: Row(
                    children: <Widget>[
                      for (int i = 0; i < entries.length; i++) ...<Widget>[
                        Expanded(
                          child: _SnapshotTile(
                            snapshot: entries[i],
                            isActive: baseIndex + i == activeSnapshotIndex,
                          ),
                        ),
                        if (i != entries.length - 1) const SizedBox(width: 18),
                      ],
                      if (entries.length == 1) const Spacer(),
                    ],
                  ),
                );
              }

              return Column(
                children: <Widget>[
                  buildRow(topRow, 0),
                  const SizedBox(height: 18),
                  buildRow(bottomRow, topRow.length),
                ],
              );
            },
          ).animate().fadeIn(duration: 360.ms, delay: 120.ms),
        ),
      ],
    );
  }
}

class _SmyslHeroView extends StatelessWidget {
  const _SmyslHeroView({required this.hero});

  final _HeroShowcase hero;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: NeoColors.accent.withValues(alpha: 0.4),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    hero.assetPath,
                    fit: BoxFit.cover,
                    package: 'infra_pitch_deck',
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: NeoColors.primary.neoOpacity(0.6),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'Flagship • Smysl',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().scale(duration: 380.ms, curve: Curves.easeOutBack),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: NeoColors.primary.neoOpacity(0.3)),
              gradient: const LinearGradient(
                colors: <Color>[Color(0x33251F4A), Color(0x11251F4A)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hero.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  hero.summary,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: NeoColors.textSecondary,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: hero.metrics
                      .map((metric) => _HeroMetricChip(metric: metric))
                      .toList(),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 420.ms, delay: 140.ms),
        ),
      ],
    );
  }
}

class _SnapshotTile extends StatelessWidget {
  const _SnapshotTile({required this.snapshot, required this.isActive});

  final _SnapshotEntry snapshot;
  final bool isActive;

  Widget _buildSnapshotImage(String path, bool isVertical) {
    return AspectRatio(
      aspectRatio: isVertical ? 9 / 19.5 : 16 / 9,
      child: Image.asset(
        path,
        fit: isVertical ? BoxFit.fitHeight : BoxFit.cover,
        alignment: Alignment.center,
        package: 'infra_pitch_deck',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasPair = snapshot.secondaryAssetPath != null;

    return AnimatedContainer(
      duration: 260.ms,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isActive
              ? NeoColors.accent
              : NeoColors.primary.neoOpacity(0.22),
          width: isActive ? 2 : 1,
        ),
        color: NeoColors.primary.neoOpacity(0.12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: hasPair
                  ? Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildSnapshotImage(
                            snapshot.assetPath,
                            snapshot.isVertical,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildSnapshotImage(
                            snapshot.secondaryAssetPath!,
                            snapshot.secondaryIsVertical,
                          ),
                        ),
                      ],
                    )
                  : _buildSnapshotImage(
                      snapshot.assetPath,
                      snapshot.isVertical,
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            snapshot.label,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroMetricChip extends StatelessWidget {
  const _HeroMetricChip({required this.metric});

  final _HeroMetric metric;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.25)),
        color: NeoColors.primary.neoOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            metric.label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: NeoColors.textSecondary,
            ),
          ),
          Text(
            metric.value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectShowcase {
  const _ProjectShowcase({
    required this.title,
    required this.summary,
    required this.icon,
    required this.snapshots,
  });

  final String title;
  final String summary;
  final IconData icon;
  final List<_SnapshotEntry> snapshots;
}

class _SnapshotEntry {
  const _SnapshotEntry({
    required this.label,
    required this.caption,
    required this.assetPath,
    this.isVertical = false,
    this.secondaryAssetPath,
    this.secondaryIsVertical = false,
  });

  final String label;
  final String caption;
  final String assetPath;
  final bool isVertical;
  final String? secondaryAssetPath;
  final bool secondaryIsVertical;
}

class _HeroShowcase {
  const _HeroShowcase({
    required this.title,
    required this.summary,
    required this.assetPath,
    required this.metrics,
  });

  final String title;
  final String summary;
  final String assetPath;
  final List<_HeroMetric> metrics;
}

class _HeroMetric {
  const _HeroMetric({required this.label, required this.value});

  final String label;
  final String value;
}
