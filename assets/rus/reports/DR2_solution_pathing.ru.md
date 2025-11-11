# Исследование 2 — Карта решений и портфель развития

## 1. Исполнительное резюме
- **Почему сейчас**: российские инфраструктурные провайдеры спешат доказать суверенные AI-возможности, соблюдая резидентность и требования локализации; рост выручки Selectel на 46% и план инвестировать 10 млрд ₽ в AI подчёркивают срочность [A4][A5].
- **Полярная звезда**: позиционируем провайдера как операционный нервный центр AI-нагрузок за счёт сочетания Console Copilot, суверенного AI-маркетплейса и модулей поддержки с приоритетом комплаенса.
- **Отстройка**: наш дуэт инженер + продукт приносит практический опыт мульти-оркестрации (MCP, Dagger, векторные базы) по мотивам мировых AI-фабрик и экосистем разработчиков AWS/GitHub [A1][A2].
- **Амбиция на 12 месяцев**: построить компактную, но масштабируемую программу, снижающую MTTR на 40%, выводящую 20+ отобранных офферов на витрину и создающую прозрачный комплаенс, который ускоряет доверие партнёров [A1][A4][A7].

## 2. Каталог Discovery (30 концептов)
Детальный каталог (целевая роль, ценность, стек, усилия, выгода для Векуса, источники) опубликован в {{doc:discovery_catalog_table_referenced|discovery_catalog_table_referenced.ru}}. Сводно решения группируются в четыре кластера:
- **Operations Nerve Center.** Console Copilot Core, Incident War Room Summaries, Observability Storyboard и Security Playbook Agent повышают прозрачность операций и сокращают MTTR за счёт мульти-оркестрации и автоматизированных runbook-ов.
- **Marketplace Growth.** Marketplace Launchpad, Partner Sandbox Orchestrator, Marketplace Quality Scoring, Industry Catalyst Bundles и Edge Placement Planner создают поток суверенных офферов и прозрачные Trust Center scorecards.
- **Compliance & Trust.** Compliance Guardrail Advisor, Sovereign Data Toolkit, Compliance Evidence Vault и Resident Program Tracker вшивают требования 152‑ФЗ в Launchpad/Sandbox, обеспечивая неизменяемые журналы и контроль статусов стран.
- **Ecosystem & Intelligence.** Cost Anomaly Radar, Billing Intelligence Copilot, Learning Loop Analytics, AI Adoption Navigator и Community Knowledge Graph соединяют финансовые и продуктовые метрики, ускоряя принятие решений.

Каталог служит матрицей приоритизации: видно, какие API (мониторинг, биллинг, CRM), политики и партнёрские процессы нужно открыть на каждой фазе roadmap, чтобы Vekus получил измеримый эффект.

## 3. Флагманская дорожная карта (6–12 месяцев)
### Фаза 0 — Ignite (недели 0–4)
- Поднять телеметрию и биллинговые витрины для будущей автоматизации и FinOps-кейсов [A4].
- Доставить read-only статусный дайджест в Console Copilot, чтобы быстро показать ценность [A2].
- Подготовить политику маркетплейса в соответствии с требованиями локализации данных [A7].

### Фаза 1 — Foundation (месяцы 1–3)
- Включить исполнение ранбуков в Console Copilot и запустить Incident War Room summaries [A2].
- Выпустить MVP Marketplace Launchpad и первые три AI Solution Blueprint [A1][A3].
- Запустить альфу Compliance Guardrail Advisor и дашборды Cost Anomaly Radar для внутренних команд [A4][A7].
- **Метрики**: ≥70% инцидентов саммаризуются Copilot’ом; три партнёрских оффера онборжены; чек-лист комплаенса заполнен на 80%.

### Фаза 2 — Pilot Scale (месяцы 3–6)
- Добавить управляемую автоматизацию (аппрувалы, изменения) и бета Voice Ops Companion в Console Copilot [A2][A3].
- Ввести Partner Sandbox Orchestrator, Marketplace Quality Scoring и Trust Center-прозрачность [A1][A5].
- Деплоить Billing Intelligence Copilot и Resident Program Tracker для монетизации и успеха партнёров [A4].
- **Метрики**: 50% обслуживающих задач автоматизированы; NPS партнёров ≥8; прогноз биллинга точен в пределах ±5%.

### Фаза 3 — Expansion (месяцы 6–12)
- Интегрировать Security Playbook Agent и Observability Storyboard для проактивной устойчивости [A3][A5].
- Выпустить Industry Catalyst Bundles и Edge Placement Planner для роста выручки витрины [A1][A5].
- Развернуть Compliance Evidence Vault и Learning Loop Analytics для непрерывного улучшения [A2][A7].
- **Метрики**: MTTR ↓40%; 20+ офферов в маркетплейсе; подготовка аудита <5 дней.

### Поперечные зависимости и быстрые победы
- Ранний приоритет дата-пайплайнов — питают всех AI-агентов.
- Применять прогрессивную автоматизацию (читать → рекомендовать → выполнять), чтобы управлять рисками.
- Репаковать контент блюпринтов как материал для партнёрских продаж, получая быстрый маркетинговый эффект.

## 4. Штат и операционная модель
- **Ключевые роли**: продакт/стратег (hensybex) ведёт discovery, GTM, комплаенс-нарратив; инженер/архитектор собирает MCP/Dagger-интеграции и автоматизацию.
- **Ритм**: еженедельные синки по roadmap, ежедневные асинхронные стендапы, ежемесячные демонстрации для руководства, привязанные к метрикам [A2].
- **Распределение фокуса**: 40% — Console Copilot, 35% — витрина, 15% — поддерживающие модули, 10% — метрики/дока.
- **Расширенный под**: fractional-дизайнер (фазы 1–2) и частичный юрист для проверки офферов; подключать менеджеров партнёров к валидации [A5][A7].
- **Инструменты**: оркестратор MCP, Dagger CI, векторная БД, DuckDB/Snowflake для аналитики, GitHub Agent HQ для multi-agent разработки [A2].

## 5. Риски и смягчение
- **Ошибочная автоматизация**: неконтролируемые ранбуки могут вызвать сбой → внедряем approve-гейты, канари-исполнение и rollback в Console Copilot [A2].
- **Нарушение комплаенса**: партнёрские офферы могут нарушать резидентность → автоматизируем проверки и ручные ревью через Compliance Guardrail Advisor и Trust Center [A7].
- **Перегруз дуэта**: две ключевые роли могут утонуть в операционке → заранее инвестируем в MCP Pipeline Studio и Learning Loop Analytics для мультипликации усилий [A2].
- **Инерция партнёров**: экосистема может сомневаться в новой витрине → демонстрируем масштабы инвестиций Selectel и прозрачность Trust Center для доверия [A4][A5].

## 6. Приложения
- **A. Дополнительные заметки и артефакты**
  - Обзор макроландшафта: {{doc:macro_landscape|Макроландшафт — AI-инфраструктура и агентные платформы (ноябрь 2025)}}.
  - Детализация roadmap: {{doc:roadmap_draft|Черновик флагманской дорожной карты}}.
  - Детализация staffing-модели: {{doc:staffing_model_draft|Staffing & Operating Model — черновик}}.
- **B. Источники**
  - [A1] AWS Partner Agent Factory — {{doc:20251105t134242z_aws_partner_agent_factory|AWS Partner Agent Factory}}.
  - [A2] GitHub Agent HQ (The Verge) — {{doc:theverge_github_agent_hq_summary|GitHub Agent HQ — выдержки из The Verge / Sources}}.
  - [A3] Azure AI Foundry “Future of AI Agents” — {{doc:azure_ai_foundry_future_agents_summary|Azure AI Foundry — «Weird, Warm & Wild» агенты}}.
  - [A4] Финрезультаты Selectel (AKM) — {{doc:akm_selectel_ifrs_summary|Selectel — ключевые финпоказатели (IFRS/RAS)}}.
  - [A5] Selectel — стратегические акценты (TAdviser) — {{doc:tadviser_selectel_highlights|Selectel — ключевые факты из TAdviser (2021–2025)}}.
  - [A6] Профиль Selectel (Wikipedia) — {{doc:wiki_selectel_summary|Справка о Selectel (по материалам Wikipedia/iKS)}}.
  - [A7] Требования локализации данных в РФ (Wikipedia) — {{doc:wiki_data_localization_russia|Режим локализации данных в РФ (152‑ФЗ)}}.
