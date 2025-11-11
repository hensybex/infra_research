// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class FinancialsRoiSlide extends FlutterDeckSlide {
  FinancialsRoiSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/financials',
          title: 'Финансовая модель',
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
                    'Экономика AI-платформы: альтернативы дороже, ROI до 30×',
                subtitle:
                    'Оцениваем стоимость типовых сценариев, затем фиксируем бюджет инициативы под ключ',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const _AlternativesTable(),
                      const SizedBox(height: 24),
                      AnimatedOpacity(
                        opacity: step >= 2 ? 1 : 0,
                        duration: 360.ms,
                        child: _ScenarioChart(step: step),
                      ),
                      const SizedBox(height: 24),
                      AnimatedOpacity(
                        opacity: step >= 3 ? 1 : 0,
                        duration: 360.ms,
                        child: const _BudgetSummaryCard(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Scenario {
  const _Scenario({required this.name, required this.value, required this.roi});

  final String name;
  final String value;
  final String roi;
}

class _ScenarioChart extends StatelessWidget {
  const _ScenarioChart({required this.step});

  final int step;

  static const List<_Scenario> scenarios = <_Scenario>[
    _Scenario(name: 'Консервативный', value: '72.6 млн ₽', roi: '6.6×'),
    _Scenario(name: 'Ожидаемый', value: '192.6 млн ₽', roi: '17.6×'),
    _Scenario(name: 'Агрессивный', value: '329.7 млн ₽', roi: '30×'),
  ];

  @override
  Widget build(BuildContext context) {
    final revealed = step.clamp(0, scenarios.length);

    return Row(
      children: <Widget>[
        for (int index = 0; index < scenarios.length; index++) ...<Widget>[
          Expanded(
            child: _ScenarioBar(
              scenario: scenarios[index],
              highlighted: index < revealed,
            ),
          ),
          if (index != scenarios.length - 1) const SizedBox(width: 12),
        ],
      ],
    ).animate().fadeIn(duration: 360.ms);
  }
}

class _ScenarioBar extends StatelessWidget {
  const _ScenarioBar({required this.scenario, required this.highlighted});

  final _Scenario scenario;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!highlighted) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.3)),
        gradient: const LinearGradient(
          colors: <Color>[Color(0x332D174F), Color(0x112D174F)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            scenario.name,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            scenario.value,
            style: theme.textTheme.titleLarge?.copyWith(
              color: NeoColors.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Окупаемость инвестиций (ROI) ${scenario.roi}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: NeoColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetSummaryCard extends StatelessWidget {
  const _BudgetSummaryCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.3)),
        gradient: const LinearGradient(
          colors: <Color>[Color(0x332D174F), Color(0x112D174F)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Бюджет инициативы',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Ориентировочный годовой бюджет запуска AI-платформы под ключ: 24–36 млн ₽.',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: NeoColors.accent,
            ),
          ),
          const SizedBox(height: 16),
          const _BudgetBullet(
            text:
                'Включает внешнюю архитектуру Copilot, продуктовую, R&D и data-функции.',
          ),
          const SizedBox(height: 10),
          const _BudgetBullet(
            text:
                'Закладывает инфраструктуру, лицензии, витрину доверия и пилотные сценарии резидентов.',
          ),
          const SizedBox(height: 10),
          const _BudgetBullet(
            text:
                'Оплата по этапам внедрения; премия за успех настраивается под KPI оператора.',
          ),
          const SizedBox(height: 12),
          Text(
            'Такой пакет дешевле глобальных альтернатив и позволяет сохранить контроль над интеллектуальной собственностью.',
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

class _BudgetBullet extends StatelessWidget {
  const _BudgetBullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Icon(Icons.check_circle, color: NeoColors.accent, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: NeoColors.textSecondary,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _AlternativesTable extends StatelessWidget {
  const _AlternativesTable();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.28)),
        gradient: const LinearGradient(
          colors: <Color>[Color(0x3329104F), Color(0x1129104F)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Почему альтернативы дороже',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          const _AlternativeRow(
            title: 'Внутренний найм',
            description:
                '≈10.9 млн ₽ зарплат + ≥6 месяцев на закрытие вакансий + отдельный бюджет на автоматизацию.', // Источник: slides/slide11.md
          ),
          const SizedBox(height: 8),
          const _AlternativeRow(
            title: 'международные студии',
            description:
                '\$200–\$350/час → 150–260 млн ₽/год, модель расчёта по человеку-часам и нет фокуса на российском соответствии требованиям.', // Источник: slides/slide11.md
          ),
          const SizedBox(height: 8),
          const _AlternativeRow(
            title: 'Ничего не делать',
            description:
                '−70 млн ₽ потенциальной выгоды и риск штрафов Роскомнадзора 10–20 млн ₽.', // Источник: slides/slide11.md
          ),
        ],
      ),
    );
  }
}

class _AlternativeRow extends StatelessWidget {
  const _AlternativeRow({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.close, color: NeoColors.secondary),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: NeoColors.textSecondary,
                height: 1.45,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: '$title: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: NeoColors.textPrimary,
                  ),
                ),
                TextSpan(text: description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
