// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../widgets/neo_headline.dart';
import '../../widgets/neo_metric_card.dart';
import '../../widgets/neo_slide_scaffold.dart';

class ProofPointsSlide extends FlutterDeckSlide {
  ProofPointsSlide({super.key})
    : super.template(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/proof',
          title: 'Доказательная база',
          steps: 2,
        ),
        contentBuilder: _build,
      );

  static Widget _build(BuildContext context) {
    final theme = Theme.of(context);

    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          final showSummary = step >= 2;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoHeadline(
                title: 'Доказательная база',
                subtitle:
                    'Мировые лидеры уже доказали: оркестратор + фокус = результат уровня крупнейших облачных провайдеров без десятков штатных единиц. Мы идём тем же путём.',
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: NeoMetricCard(
                        metric: 'Forethought (США)',
                        caption: '3 инженера → 30 млн+ обращений',
                        description:
                            'Команда переключает модели под каждого клиента SupportGPT (виртуальный ассистент поддержки) и держит корпоративный уровень сервиса благодаря оркестрации.', // Источник: slides/slide04.md
                        icon: Icons.support_agent,
                        delay: Duration(milliseconds: 0),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: NeoMetricCard(
                        metric: 'Shisa.ai (Япония)',
                        caption: 'LLM на 405 млрд параметров за месяц',
                        description:
                            '«Нано-команда» из 3 человек вывела продукт и собрала 1 млн скачиваний благодаря строго выстроенной оркестрации.', // Источник: slides/slide04.md
                        icon: Icons.language,
                        delay: Duration(milliseconds: 140),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: NeoMetricCard(
                        metric: 'Soile AI (Казахстан)',
                        caption: '4 студента → 6 месяцев',
                        description:
                            'Построили голосового ассистента для клиник (бот + веб-интерфейсы и носимые устройства), показав, что правильный стек решает задачи в медицине и операциях.', // Источник: slides/slide04.md
                        icon: Icons.healing,
                        delay: Duration(milliseconds: 280),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: showSummary ? 1 : 0,
                duration: 360.ms,
                child:
                    Text(
                          'Мировые лидеры уже доказали: оркестратор + фокус = результат уровня крупнейших облачных провайдеров без десятков штатных единиц. Мы идём тем же путём.',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            height: 1.5,
                          ),
                        )
                        .animate(target: showSummary ? 1 : 0)
                        .moveY(begin: 16, end: 0, duration: 360.ms),
              ),
            ],
          );
        },
      ),
    );
  }
}
