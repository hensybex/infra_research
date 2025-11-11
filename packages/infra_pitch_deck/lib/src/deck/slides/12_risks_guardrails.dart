// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_badge.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class RisksGuardrailsSlide extends FlutterDeckSlide {
  RisksGuardrailsSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/risks-guardrails',
          title: 'Риски и защитные контуры',
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
                    'Риски под контролем: что зависит от клиента и как мы страхуем проект',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: _risks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final risk = _risks[index];
                    return _RiskBlock(
                      index: index,
                      step: step,
                      title: risk.title,
                      client: risk.client,
                      ourPart: risk.ourPart,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: step >= _risks.length ? 1 : 0,
                duration: 360.ms,
                child: const NeoBadge(
                  label: 'Чек-лист → исполнение → аудит',
                  icon: Icons.verified,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RiskBlock extends StatelessWidget {
  const _RiskBlock({
    required this.index,
    required this.step,
    required this.title,
    required this.client,
    required this.ourPart,
  });

  final int index;
  final int step;
  final String title;
  final String client;
  final String ourPart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final visible = step >= index + 1;

    if (!visible) {
      return const SizedBox.shrink();
    }

    return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: NeoColors.primary.neoOpacity(0.3)),
            gradient: const LinearGradient(
              colors: <Color>[Color(0x3329104F), Color(0x1129104F)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              _RiskRow(
                icon: Icons.assignment,
                label: 'Клиент делает',
                text: client,
              ),
              const SizedBox(height: 8),
              _RiskRow(
                icon: Icons.check_circle,
                label: 'Мы страхуем',
                text: ourPart,
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 360.ms)
        .moveY(begin: 14, end: 0, curve: Curves.easeOut);
  }
}

class _RiskData {
  const _RiskData({
    required this.title,
    required this.client,
    required this.ourPart,
  });

  final String title;
  final String client;
  final String ourPart;
}

const List<_RiskData> _risks = <_RiskData>[
  _RiskData(
    title: 'Телеметрия и интерфейсы',
    client:
        'Нужны доступы к логам, биллингу, реестру конфигураций (CMDB).', // Источник: slides/slide12.md
    ourPart:
        'Настраиваем режим только для чтения и журналирование всех вызовов.', // Источник: slides/slide12.md
  ),
  _RiskData(
    title: 'Управление автоматизацией',
    client:
        'Каждый операционный сценарий получает одобрение и план отката.', // Источник: slides/slide12.md
    ourPart:
        'Проводим тест на ограниченной выборке, фиксируем rollback и отслеживаем одобрения.', // Источник: slides/slide12.md
  ),
  _RiskData(
    title: 'Соответствие требованиям и дружественные страны',
    client:
        'Чек-лист 152‑ФЗ, уведомления Роскомнадзора, резервные площадки в России.', // Источник: slides/slide12.md
    ourPart:
        'Подключаем партнёров из BRICS только после проверки юрисдикции и ведём защищённое хранилище доказательств.', // Источник: slides/slide12.md
  ),
];

class _RiskRow extends StatelessWidget {
  const _RiskRow({required this.icon, required this.label, required this.text});

  final IconData icon;
  final String label;
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
          child: RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: NeoColors.textSecondary,
                height: 1.45,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: NeoColors.textPrimary,
                  ),
                ),
                TextSpan(text: text),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
