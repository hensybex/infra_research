## Задача: разложить весь контент по языковым папкам и обеспечить парность источников RU/EN

### Что нужно было сделать
1. Создать директории `assets/rus/{reports,notes}` и `assets/eng/{reports,notes}`. Обновить `pubspec.yaml`, если пути изменятся.
2. Перенести существующие файлы:
   - Английские версии — в `assets/eng/...`
   - Русские версии — в `assets/rus/...`
   - Для отчётов без перевода (`DR1_architecture_validation*.md`, `DR2_5_market_access*.md`, `DR2_solution_pathing*.md`, `DR3_value_pricing*.md`) и всех заметок из списка ниже подготовить содержательные русские адаптации и сохранить в `assets/rus/...` рядом с оригиналами.
3. Список заметок, которые надо продублировать на русский:
   - `DR2_5_compliance_checklist.md`
   - `DR2_decision_log.md`
   - `DR3_pricing_table.md`
   - `akm_selectel_ifrs_summary.md`
   - `azure_ai_foundry_future_agents_summary.md`
   - `brief_strategy.md`
   - `current_schema.md`
   - `discovery_catalog_draft.md`
   - `discovery_catalog_table_referenced.md`
   - `macro_landscape.md`
   - `mts_marketplace_news_summary.md`
   - `overall_plan.md`
   - `roadmap_draft.md`
   - `staffing_model_draft.md`
   - `tadviser_selectel_highlights.md`
   - `theverge_github_agent_hq_summary.md`
   - `wiki_data_localization_russia.md`
   - `wiki_selectel_summary.md`
4. Обновить все упоминания `notes/...` и `reports/...` внутри Markdown так, чтобы они ссылались на новый путь (например, `rus/notes/...` или `eng/reports/...`). Важно сохранить согласованность: русские отчёты должны ссылаться на русские заметки/отчёты, английские — на английские.
5. После переносов прогнать `flutter pub get`, убедиться, что `AssetManifest` содержит новые пути, и что приложение продолжает отображать оба языка.

### Итоговое состояние (2025‑11‑05)
- Введена двухуровневая структура `assets/eng/...` и `assets/rus/...`; наследованные каталоги удалены.
- Все 4 отчёта получили пары `*_full.ru.md`, каждая заметка из списка имеет русскую адаптацию (`*.ru.md`).
- Markdown-ссылки теперь используют префиксы `eng/` и `rus/` по языку, `pubspec.yaml` смотрит на новые пути, приложение читает AssetManifest с обоими наборами файлов.
