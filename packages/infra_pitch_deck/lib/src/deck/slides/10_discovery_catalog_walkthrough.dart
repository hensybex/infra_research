// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../theme/neo_colors.dart';
import '../../widgets/neo_headline.dart';
import '../../widgets/neo_slide_scaffold.dart';

class DiscoveryCatalogWalkthroughSlide extends FlutterDeckSlide {
  DiscoveryCatalogWalkthroughSlide({super.key})
    : super.template(
        configuration: FlutterDeckSlideConfiguration(
          route: '/discovery-catalog',
          title: 'Каталог решений',
          steps: _categories.length,
        ),
        contentBuilder: _build,
      );

  static final List<_CatalogCategory> _categories = <_CatalogCategory>[
    _CatalogCategory(
      name: 'Операционное ядро',
      items: <_CatalogItem>[
        _CatalogItem(
          title: 'Консольный помощник оператора',
          description:
              'Единое окно, где инженер видит состояние сервисов, получает инструкцию и запускает сценарии без хаоса в чатах.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Штаб инцидентов',
          description:
              'При аварии собирает хронологию, рекомендации и задачи, чтобы руководить устранением не выходя из дэшборда.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Переводчик сценариев миграции',
          description:
              'Быстро переносит runbook’и из других облаков и экономит недели внедрения.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Панель наблюдаемости',
          description:
              'Связывает логи, метрики и трассировки в одну историю, чтобы за минуты находить первопричину.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Студия сценариев оркестрации',
          description:
              'Визуальный конструктор, где инженеры собирают, тестируют и публикуют автоматизацию без сотен скриптов.', // Источник: BI_CATALOGUE.md
        ),
      ],
    ),
    _CatalogCategory(
      name: 'Деньги и мощности',
      alignRight: true,
      items: <_CatalogItem>[
        _CatalogItem(
          title: 'Радар аномалий затрат',
          description:
              'Отлавливает странные скачки в счетах и подсказывает, где оптимизировать расходы или предложить пакет услуг.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Планировщик графических мощностей',
          description:
              'Следит за спросом на GPU и советует, когда расширять мощности или перераспределять их.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Финансовый помощник по биллингу',
          description:
              'Прогнозирует расходы, моделирует «что если» и рекомендует резервирование ресурсов без сюрпризов.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Монитор жизненного цикла оборудования',
          description:
              'Цифровой двойник железа: показывает состояние, план обслуживания и риск выхода из строя.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Планировщик размещения на периферии',
          description:
              'Рекомендует точки присутствия, чтобы снизить задержки и сохранять резидентность данных.', // Источник: BI_CATALOGUE.md
        ),
      ],
    ),
    _CatalogCategory(
      name: 'Партнёрский успех',
      items: <_CatalogItem>[
        _CatalogItem(
          title: 'Пусковая площадка витрины',
          description:
              'Пошаговый мастер, который ведёт партнёра от тестов до публикации без длинной переписки.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Оркестратор песочниц партнёров',
          description:
              'Разворачивает демо-стенды с тестовыми данными и мониторингом в один клик.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Панель доходов партнёров',
          description:
              'Дает прозрачность по выручке, совместным сделкам и бонусам, чтобы вовремя поддержать экосистему.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Помощник по запуску для разработчиков',
          description:
              'Интерактивный проводник по API и примерам кода, ускоряющий интеграцию внешних сервисов.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Трекер программы резидентов',
          description:
              'Фиксирует стадии, встречи и бонусы стартапов, чтобы программа резидентов не буксовала.', // Источник: BI_CATALOGUE.md
        ),
      ],
    ),
    _CatalogCategory(
      name: 'Доверие и соответствие требованиям',
      alignRight: true,
      items: <_CatalogItem>[
        _CatalogItem(
          title: 'Советник по соблюдению правил',
          description:
              'Проверяет сервисы и предложения на соответствие локальным требованиям и показывает, что править до визита Роскомнадзора.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Набор инструментов для суверенных данных',
          description:
              'Готовые пайплайны и контрольные точки, которые гарантируют нахождение данных в РФ.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Помощник по безопасности',
          description:
              'Выполняет сценарии реакции на DDoS и утечки, ведёт журнал задач безопасности.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Витрина доверия',
          description:
              'Публичная страница с доказательствами размещения данных, SLA и стоимости — повышает доверие клиентов.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Хранилище доказательств соответствия',
          description:
              'Собирает акты, логи и подтверждения по 152‑ФЗ в готовый пакет для аудиторов.', // Источник: BI_CATALOGUE.md
        ),
      ],
    ),
    _CatalogCategory(
      name: 'Рост и экосистема',
      items: <_CatalogItem>[
        _CatalogItem(
          title: 'Консьерж по онбордингу клиентов',
          description:
              'Помогает собрать нагрузку, бюджет и требования клиента и превращает всё это в план запуска.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Система оценки предложений витрины',
          description:
              'Анализирует качество, отзывы и соответствие требованиям партнёрских решений и выдаёт понятный рейтинг.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Библиотека отраслевых схем',
          description:
              'Готовые схемы внедрения ИИ для ритейла, финтеха, логистики и других отраслей.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Отраслевые пакеты решений',
          description:
              'Комплекты сценариев, которые можно продавать партнёру как готовую ценность.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Навигатор по внедрению ИИ',
          description:
              'Диагностирует готовность компании и предлагает подходящие решения из витрины.', // Источник: BI_CATALOGUE.md
        ),
      ],
    ),
    _CatalogCategory(
      name: 'Голос и поле',
      alignRight: true,
      items: <_CatalogItem>[
        _CatalogItem(
          title: 'Помощник службы поддержки',
          description:
              'Классифицирует обращения, предлагает готовый ответ и запускает автоматический сценарий исправления.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Голосовой помощник полевых инженеров',
          description:
              'Помогает инженерам диктовать отчёты, искать инструкции и заводить заявки голосом даже без стабильного интернета.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Биржа зрелости наблюдаемости',
          description:
              'Сравнивает, насколько партнёры собирают телеметрию, и даёт советы по улучшению устойчивости.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Аналитика цикла обучения',
          description:
              'Показывает, как сотрудники и клиенты используют ИИ-сервисы, и где они «падают» по пути обучения.', // Источник: BI_CATALOGUE.md
        ),
        _CatalogItem(
          title: 'Граф знаний сообщества',
          description:
              'Открытая база скриптов, инструкций и решённых инцидентов, где пользователи делятся рецептами.', // Источник: BI_CATALOGUE.md
        ),
      ],
    ),
  ];

  static Widget _build(BuildContext context) {
    return NeoSlideScaffold(
      child: FlutterDeckSlideStepsBuilder(
        builder: (BuildContext context, int step) {
          final activeIndex = (step - 1).clamp(0, _categories.length - 1);
          final show = step > 0;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoHeadline(
                title: 'Каталог из 30 решений — интерактивный обзор',
                subtitle:
                    'Каждая категория — готовый мини-пакет, который можно включить в дорожную карту или продать партнёру отдельно.',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: AnimatedSwitcher(
                  duration: 400.ms,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.05, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                  child: show
                      ? _CategoryDetail(
                          key: ValueKey<int>(activeIndex),
                          category: _categories[activeIndex],
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CatalogCategory {
  const _CatalogCategory({
    required this.name,
    required this.items,
    this.alignRight = false,
  });

  final String name;
  final List<_CatalogItem> items;
  final bool alignRight;
}

class _CatalogItem {
  const _CatalogItem({required this.title, required this.description});

  final String title;
  final String description;
}

class _CategoryDetail extends StatelessWidget {
  const _CategoryDetail({required this.category, super.key});

  final _CatalogCategory category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool alignRight = category.alignRight;
        final double width = constraints.maxWidth;
        const double spacing = 20;
        final int columns = width >= 1500
            ? 3
            : width >= 1000
            ? 2
            : 1;
        final double itemWidth = columns == 1
            ? width
            : (width - spacing * (columns - 1)) / columns;

        return Column(
          crossAxisAlignment: alignRight
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              category.name,
              textAlign: alignRight ? TextAlign.right : TextAlign.left,
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: spacing,
              runSpacing: spacing,
              alignment: alignRight ? WrapAlignment.end : WrapAlignment.start,
              children: <Widget>[
                for (final _CatalogItem item in category.items)
                  SizedBox(
                    width: columns == 1 ? width : itemWidth,
                    child: _CatalogItemCard(item: item, alignRight: alignRight),
                  ),
              ],
            ),
            const Spacer(),
            Text(
              'Каждый мини-пакет можно встроить в дорожную карту или продать партнёру как отдельный продукт.',
              textAlign: alignRight ? TextAlign.right : TextAlign.left,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: NeoColors.textSecondary,
                height: 1.45,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CatalogItemCard extends StatelessWidget {
  const _CatalogItemCard({required this.item, required this.alignRight});

  final _CatalogItem item;
  final bool alignRight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.3)),
        gradient: const LinearGradient(
          colors: <Color>[Color(0x33292B5A), Color(0x11292B5A)],
        ),
      ),
      child: Column(
        crossAxisAlignment: alignRight
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.title,
            textAlign: alignRight ? TextAlign.right : TextAlign.left,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            textAlign: alignRight ? TextAlign.right : TextAlign.left,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: NeoColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
