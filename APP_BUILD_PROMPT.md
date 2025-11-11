# Infra Research App — Build Brief

## Цель
Собрать кроссплатформенное Flutter‑приложение, которое офлайн отображает DR‑исследования (Markdown) и даёт быстрый доступ к PDF/DOCX-версии, источникам и таймлайну обновлений. Приложение используется заказчиком как «живой каталог» результатов.

## Контент
- Все актуальные `.md` отчёты лежат в `assets/eng/reports/` и `assets/rus/reports/` (папки зеркальны: DR1, DR2, DR2.5, DR3, полноформатные версии, локализации).
- Навигационное описание см. `assets/meta/HYPOTHETIC_NAVIGATION.md`.
- Поддерживающие материалы (заметки/таблицы) лежат в `assets/eng/notes/` и `assets/rus/notes/` и используются как источники/приложения. Список на сегодня:
  - `DR2_5_compliance_checklist.md`, `DR2_decision_log.md`, `DR3_pricing_table.md`, `DR3_pricing_table.csv`,
  - `akm_selectel_ifrs_summary.md`, `azure_ai_foundry_future_agents_summary.md`, `brief_strategy.md`, `current_schema.md`,
  - `discovery_catalog_draft.md`, `discovery_catalog_table_referenced.md`, `macro_landscape.md`, `mts_marketplace_news_summary.md`,
  - `overall_plan.md`, `roadmap_draft.md`, `staffing_model_draft.md`, `tadviser_selectel_highlights.md`,
  - `theverge_github_agent_hq_summary.md`, `wiki_data_localization_russia.md`, `wiki_selectel_summary.md`.
- Если в тексте отчёта встречается ссылка вида `eng/notes/...` или `rus/notes/...`, приложение должно уметь открыть соответствующий файл (например, в модальном viewer или отдельном экране «Note Preview»).
- Пара ссылок (`notes/DR3_value_model_results.md`, `notes/DR3_value_pricing.md`) пока ведут на материалы, которых нет в открытом пакете; эти случаи желательно обрабатывать уведомлением «Источник появится после обновления» вместо ошибки.
- В дальнейшем в `assets/{eng|rus}/reports/` могут появляться новые `*_full.md`; приложение должно подхватывать их автоматически (динамическое чтение ассетов). Аналогично с `assets/{eng|rus}/notes/`.

## Основные экраны
1. **Home** — карточки DR1–DR3/DR2.5 с KPI, кнопки «Скачать ZIP» и «Поделиться».
2. **Library** — список всех DR-файлов (читаем заголовок `#` + метаданные), фильтры по тегам (Architecture/Roadmap/Compliance/Value), поиск.
3. **Detail View** — Markdown viewer (`flutter_markdown`) с оглавлением, sticky header и действиями `PDF`, `DOCX`, `Share`, `Copy Quote`.
4. **Sources Hub** — агрегированный список источников (раздел «## Источники» из каждого файла) с фильтром internal/external и экспортом CSV.
5. **Timeline** — хронология изменений (можно взять данные из `research_log.md` позже; пока достаточно локального плейсхолдера).
6. **Profile** — контакты дуэта, кнопка «Запросить апдейт».

## Навигация
- Нижний навбар: Home / Library / Sources / Timeline / Profile.
- Для tablet/web дополнительно показывать боковую панель оглавления.

## Функциональные требования
- Асинхронная загрузка Markdown из ассетов (изолят для индексации, чтобы не блокировать UI).
- Кэширование результатов поиска (можно в memory store).
- Кнопка «Скачать ZIP» должна открывать внешнюю ссылку (пока плейсхолдер `https://example.com/infra_pitch_pack.zip`).
- Кнопка `PDF/DOCX` → открывает сгенерированные файлы (когда появятся) или показывает диалог «доступно скоро».
- Экспорт CSV — собирает источники и шарит через `share_plus`.
- Готовность к локализации (строки через `intl` или хотя бы `AppLocalizations` scaffold).

## Технические подсказки
- Packages: `flutter_markdown`, `go_router` или `auto_route` для навигации, `share_plus`, `provider`/`riverpod` для состояния, `collection` для фильтров.
- Структура: `lib/features/...` (home, library, detail, sources, timeline, profile), `lib/data/models/doc_entry.dart`.
- Markdown pre-processing: при чтении парсим первые уровни `##` для оглавления, отдельный parser для блока «## Источники».

## Done = ?
1. Все экраны доступны и связаны навбаром.
2. Markdown файлы из `assets/{eng|rus}/reports/` отображаются корректно, переключение между якорями работает.
3. Поиск и фильтры в Library.
4. Sources Hub показывает консолидированный список ссылок.
5. Базовые действия (Share/Copy/Placeholder downloads) работают.
6. README обновлён с инструкциями по сборке/добавлению новых отчётов.

Исполнитель может уточнять детали по `assets/meta/HYPOTHETIC_NAVIGATION.md`; любые UI-упрощения согласовываем отдельно, если блокирующих зависимостей нет.
