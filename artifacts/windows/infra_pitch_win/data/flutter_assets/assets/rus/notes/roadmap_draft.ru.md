# Черновик флагманской дорожной карты

## Визионерские опоры
- **Console Copilot / Operations Assistant:** разговорный контрольный центр для инфраструктуры, вдохновлённый трендами мультиагентных консолей (`assets/rus/notes/theverge_github_agent_hq_summary.ru.md`).
- **AI Marketplace / партнёрская витрина:** суверенная витрина по модели co-innovation (`artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`, `assets/rus/notes/tadviser_selectel_highlights.ru.md`).
- **Поддерживающие модули:** guardrails, onboarding concierge, billing intelligence из discovery-каталога.

## План (6–12 месяцев)

### Фаза 0 — Ignite (недели 0–4)
- **Выходы:** согласовать стейкхолдеров, базовые пайплайны наблюдаемости + биллинга, правила для агентов.
- **Действия:** запустить Console Copilot в режиме read-only статусов; поднять FinOps data mart; подготовить политику marketplace с учётом локализации (`assets/rus/notes/wiki_data_localization_russia.ru.md`).
- **Метрики:** ≥5 активных операторов Copilot в день; MTTR зафиксирован; свежесть биллинга <6 часов.

### Фаза 1 — Foundation (месяцы 1–3)
- **Console Copilot:** добавить исполнение runbook-ов через MCP; внедрить Incident War Room Summaries.
- **Marketplace:** MVP Launchpad с intake + compliance; опубликовать библиотеку blueprint-ов для 3 вертикалей.
- **Модули:** Compliance Guardrail Advisor alpha; Cost Anomaly Radar для FinOps.
- **Метрики:** 70% приоритизируемых инцидентов авто-суммаризируются; 3 партнёра онбордятся; чек-лист покрывает ≥80% артефактов.

### Фаза 2 — Pilot Scale (месяцы 3–6)
- **Console Copilot:** добавить автоматизацию изменений (rollback, feature flags) с апрувалами; выпустить Voice Ops Companion beta (`assets/rus/notes/azure_ai_foundry_future_agents_summary.ru.md`).
- **Marketplace:** запустить Partner Sandbox Orchestrator и Marketplace Quality Scoring; открыть Trust Center.
- **Модули:** Billing Intelligence Copilot с прогнозом; Resident Program Tracker.
- **Метрики:** 50% регламентных задач автоматизированы; NPS партнёров ≥8; точность прогноза расходов ±5%.

### Фаза 3 — Expansion (месяцы 6–12)
- **Console Copilot:** внедрить Security Playbook Agent с автоматизацией DDoS (`assets/rus/notes/tadviser_selectel_highlights.ru.md`); добавить Observability Storyboard.
- **Marketplace:** выпустить Industry Catalyst Bundles и Edge Placement Planner; довести Trust Center до 20+ офферов.
- **Модули:** масштабировать Compliance Evidence Vault; внедрить Learning Loop Analytics.
- **Метрики:** MTTR −40%; доля выручки marketplace ≥5% ARR; аудит готов <5 дней; автоматизация покрывает >60% повторяющихся задач.

## Зависимости
- **Данные вперёд.** Биллинг и телеметрия открывают большинство интеллектуальных агентов.
- **Комплаенс ниткой.** Guardrails должны появиться до массового масштабирования marketplace.
- **Постепенная автоматизация.** Режим read → suggest → execute снижает риск ошибок.

## Быстрые победы
- Digest от Console Copilot за 4 недели повышает доверие.
- Blueprint-библиотека + discovery-каталог можно перепаковать в маркетинговые материалы для партнёров.
- FinOps dashboards укорачивают ручную отчётность и дают быстрый ROI для финансов.

## Панель метрик (пример)
- **Ops:** MTTR, доля инцидентов с авто-сводками, успешность автоматизаций.
- **Marketplace:** число офферов, цикл онбординга, завершённость Trust Center.
- **Финансы:** GMV marketplace, экономия от anomaly detection, использование capex (`assets/rus/notes/akm_selectel_ifrs_summary.ru.md`).
- **Compliance:** время подготовки доказательств локализации, % нагрузок с guardrails.

## Риски и меры
- **Автоматизация.** Агрессивные runbook-и могут вызвать сбой → включаем человека в цикл и прогрессивные уровни допуска.
- **Локализация.** Партнёры могут нарушить требования → автоматические проверки + ручной гейт.
- **Ресурсы.** Дуэт ограничен → инвестируем в переиспользуемые инструменты (Pipeline Studio, Learning Loop).
- **Адаптация партнёров.** Суверенные вендоры осторожничют → упаковываем Trust Center и ко-маркетинг с акцентом на инвестиции RU рынка (`assets/rus/notes/tadviser_selectel_highlights.ru.md`).
