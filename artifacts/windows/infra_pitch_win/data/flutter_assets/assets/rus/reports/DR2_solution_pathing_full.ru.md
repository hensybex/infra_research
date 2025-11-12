# Блюпринт запуска — Полноформатная карта решений и маршрутов поставки

## Резюме
- Портфель из 30 приоритизированных решений сгруппирован в четыре кластера (Operations Nerve Center, Marketplace Growth, Compliance & Trust, Ecosystem Intelligence) и выстроен в фазовую программу Ignite → Foundation → Pilot Scale → Expansion (см. {{doc:discovery_catalog_table_referenced|discovery_catalog_table_referenced.ru}}, {{doc:roadmap_draft|Черновик флагманской дорожной карты}}).
- Северная звезда остаётся прежней: MTTR −40%, ≥20 marketplace-офферов, Trust Center ≤5 дней, прозрачный FinOps. Каждое решение привязано к этим метрикам и снабжено компонентами стека (MCP, Dagger, векторные БД, policy engine), так что клиент видит прямую связь «фича → KPI» ({{doc:dr2_solution_pathing|DR2 — Карта решений и портфель развития}}).
- Операционная модель дуэта (40% Console Copilot, 35% Marketplace, 15% Support, 10% Enablement) обеспечивает скорость без роста штата; подключение fractional специалистов прописано заранее ({{doc:staffing_model_draft|Staffing & Operating Model — черновик}}).
- Discovery каталог не просто список идей: каждая запись содержит целевую функцию, стек, оценку усилий и аргумент «почему именно этот дуэт». Это становится аргументом в продажах и планом по загрузке команды.
- Комплаенс-поток встроен в каждую фазу: автоматизированные проверки 152‑ФЗ, Evidence Vault, BRICS-ready контуры и процедуры Роскомнадзора из DR2.5 включены в Launchpad, Sandbox и Trust Center ({{doc:dr2_5_compliance_checklist|DR2.5 — Чек-лист соответствия трансграничным нагрузкам}}, {{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}).

## Контекст и цель
DR2 отвечает на вопрос «что именно мы будем строить и в какой последовательности». После валидации архитектуры (DR1) клиенту требуются конкретные сценарии, которые докажут коммерческий эффект и управляемость рисков. Бэклог должен быть достаточно насыщенным (≥30 элементов), чтобы покрыть разные департаменты (операции, продажи, финансы, комплаенс), но при этом управляемым для двух ключевых исполнителей. Мы опираемся на материалы {{doc:dr2_solution_pathing|DR2 — Карта решений и портфель развития}}, {{doc:discovery_catalog_table_referenced|discovery_catalog_table_referenced.ru}}, {{doc:roadmap_draft|Черновик флагманской дорожной карты}}, {{doc:dr2_decision_log|DR2 — Журнал решений}} и профильные заметки (macro_landscape, akm_selectel_ifrs_summary) для контекста рынка. Итоговый документ — самодостаточный гид по портфелю: от высокоуровневого резюме до подробных таблиц, цепочки value-stream, рисков и связанных артефактов.

## Ключевые выводы
1. **Консольный Copilot и Marketplace Launchpad формируют ядро.** Остальные решения либо питают их данными (FinOps, Observability), либо усиливают доверие (Compliance Guardrail, Trust Center).
2. **Discovery каталог закрывает реальные боли.** Комбинация Incident War Room, Billing Copilot, GPU Optimizer, Migration Translator и других модулей адресует операционную нагрузку Timeweb/Selectel-подобных провайдеров, а не абстрактные use case.
3. **Фазовая программа выстроена по принципу «данные → автоматизация → коммерциализация».** Ignite нацелена на доступ к телеметрии и биллингу, Foundation включает первые автоматики и Launchpad, Pilot Scale масштабирует marketplace + голос/мобильность, Expansion закрепляет Trust Center, bundles и edge-планирование ({{doc:roadmap_draft|Черновик флагманской дорожной карты}}).
4. **Комплаенс — сквозной поток.** Каждый модуль, затрагивающий данные клиентов, проходит через Checklist 152‑ФЗ, Evidence Vault и автоматические уведомления Роскомнадзора ({{doc:dr2_5_compliance_checklist|DR2.5 — Чек-лист соответствия трансграничным нагрузкам}}).
5. **Дуэт работает как «оркестратор + продакт».** Это позволяет быстро подключать MCP коннекторы, Dagger pipeline и одновременно удерживать stakeholder alignment ({{doc:staffing_model_draft|Staffing & Operating Model — черновик}}, {{doc:brief_strategy|DR2 Solution Pathing — бриф и стратегия}}).

## Детализация

### Каталог решений: кластеры и приоритеты
| Кластер | Ключевые решения | Основная ценность | Метрики влияния |
| --- | --- | --- | --- |
| **Operations Nerve Center** | Console Copilot Core, Incident War Room Summaries, Observability Storyboard, Security Playbook Agent, Voice Ops Companion | Снижение MTTR, автоматизация runbooks, прозрачность инцидентов | MTTR, % автоматизированных задач, время фиксации постмортем |
| **Marketplace Growth** | Marketplace Launchpad, Partner Sandbox Orchestrator, Marketplace Quality Scoring, Industry Catalyst Bundles, Partner Revenue Cockpit, AI Adoption Navigator | Быстрый онбординг партнёров, управление pipeline, монетизация витрины | # опубликованных офферов, цикл онбординга, GMV marketplace |
| **Compliance & Trust** | Compliance Guardrail Advisor, Sovereign Data Toolkit, AI Marketplace Trust Center, Compliance Evidence Vault, Sovereign Data Toolkit, Resident Program Tracker | Доказательная база 152‑ФЗ, прозрачные аудит-трейлы, готовность Trust Center | Время подготовки к проверке, % офферов с полным пакетом, # инцидентов |
| **Ecosystem Intelligence & FinOps** | Cost Anomaly Radar, Billing Intelligence Copilot, GPU Allocation Optimizer, Asset Lifecycle Tracker, Learning Loop Analytics, Community Knowledge Graph | Экономия capex/opex, прогнозирование спроса, обратная связь | Экономия затрат, точность прогнозов, вовлечённость партнёров |

Каждый элемент каталога описан в {{doc:discovery_catalog_table_referenced|discovery_catalog_table_referenced.ru}}: целевая аудитория, стек, оценка усилий (Low/Medium/High) и уникальное преимущество дуэта. Это превращает документ в договорную основу: клиент понимает, какие зависимости нужно закрыть (мониторинг, биллинг, правовая экспертиза), а мы — какие навыки и интеграции потребуются в каждый спринт.

### Фазовая дорожная карта (12 месяцев)
| Фаза | Период | Основные релизы | Метрики и артефакты |
| --- | --- | --- | --- |
| **Phase 0 — Ignite** | Недели 0–4 | Read-only Console Copilot с телеметрией, FinOps data mart, каркас Compliance Framework | DAU Copilot ≥5, биллинг-данные <6ч лаг, policy draft согласован (см. {{doc:roadmap_draft|Черновик флагманской дорожной карты}}) |
| **Phase 1 — Foundation** | Месяцы 1–3 | Runbook execution с approvals, Incident War Room, Marketplace Launchpad MVP, Compliance Guardrail alpha, Cost Anomaly Radar | 70% приоритетных инцидентов с автосаммари, 3 партнёра в Launchpad, checklist coverage ≥80% |
| **Phase 2 — Pilot Scale** | Месяцы 3–6 | Change automation, Voice Ops Companion beta, Partner Sandbox Orchestrator, Marketplace Trust Center, Billing Intelligence Copilot, Resident Program Tracker | 50% maintenance задач автоматизировано, partner NPS ≥8, Trust Center SLA ≤5 дней |
| **Phase 3 — Expansion** | Месяцы 6–12 | Security Playbook Agent, Observability Storyboard 2.0, Industry Catalyst Bundles, Edge Placement Planner, Compliance Evidence Vault GA, Learning Loop Analytics | MTTR −40%, ≥20 офферов с Trust Center, marketplace revenue ≥5% ARR |

Каждая фаза завершается демонстрацией KPI и приёмкой «Definition of Done». Например, Ignite закрывается после того, как Copilot показывает телеметрию без write-доступа, а биллинг-датамарт обновляется в пределах 6 часов. Это нужно, чтобы не перепрыгивать к автоматика без подготовленных данных (см. {{doc:roadmap_draft|Черновик флагманской дорожной карты}}, раздел Dependencies & Sequencing).

### Операционная модель и загрузка дуэта
- **Stream split**: 40% Console Copilot, 35% Marketplace, 15% Support modules, 10% Enablement ({{doc:staffing_model_draft|Staffing & Operating Model — черновик}}).
- **Ритуалы**: ежедневные 30-мин стендапы (минимизация блокеров), еженедельные backlog review, ежемесячные executive demos. Это критично, чтобы синхронизироваться с юридическим блоком и sales.
- **Fractional поддержка**: дизайнер (0.5 FTE) во время Foundation/Pilot и юрист по локализации (0.25 FTE) на этапе Launchpad/Trust Center. Это уже прописано в staffing note и снимает риски перегрузки.
- **Toolchain**: MCP orchestrator, Dagger pipelines, Milvus/Weaviate, DuckDB/Snowflake, Grafana/Looker, GitHub Agent HQ-подобные ритуалы ({{doc:current_schema|Infra Pitch — рабочая схема (05.11.2025)}}, {{doc:theverge_github_agent_hq_summary|GitHub Agent HQ — выдержки из The Verge / Sources}}). Это даёт возможность быстро связать Discovery решения с инфраструктурой.

### Механика Discovery → Delivery
1. **Scoping**: для каждого элемента каталога формируется короткое one-pager-описание с KPI и зависимостями (см. {{doc:dr2_solution_pathing|DR2 — Карта решений и портфель развития}}, раздел Discovery Catalog). Это feeding для backlog.
2. **Gating**: решения проходят фильтры — соответствие северной звезде, наличие данных/доступов, встроенный compliance. {{doc:dr2_decision_log|DR2 Decision Log}} фиксирует, почему выбраны именно эти проекты и какие альтернативы отложены.
3. **Build loops**: каждая фича проходит цикл read → recommend → execute; automation включается только после того, как Copilot докажет надёжность в read/suggest режимах (roadmap dependencies + risk mitigation).
4. **Feedback**: Learning Loop Analytics и Community Knowledge Graph собирают usage, NPS, инциденты. Это уже встроено в каталог (пункты 29 и 30) и служит механизмом постоянного улучшения.
5. **Commercialization**: Marketplace Launchpad + Trust Center фиксируют коммерческие метрики (GMV, take rate) и усваивают compliance результаты (DR2.5). FinOps-модули связывают их с ROI (DR3).

### Связь с DR1 и DR3
- DR1 доказал правильность архитектуры и готовность рынка; DR2 показывает, как архитектура материализуется в конкретных продуктах и фичах.
- DR3 опирается на метрики и стоимость решений: сценарии ROI (72–330 млн ₽ ценности) считают эффект MTTR, marketplace, комплаенс. Поэтому в DR2 каждая фича тэгирована по вкладу в денежные показатели (см. {{doc:dr3_pricing_table|Сводная таблица ценовых сценариев}}, {{doc:dr3_value_pricing|DR3 — Ценность, ценообразование и модель ROI}}). Например, Cost Anomaly Radar и Billing Copilot напрямую питают блок «экономия простоя/маржи», а Guardrail/Evidence Vault — «штрафы 10–20 млн ₽» в модели DR3.

## Риски и ограничения
- **Зависимость от доступа к системам.** Без открытых API мониторинга, биллинга и CRM невозможно реализовать Copilot и Launchpad. Нужно зафиксировать это в SOW и определить SLA по данным ({{doc:roadmap_draft|Черновик флагманской дорожной карты}}).
- **Комплаенс-эскалации.** Роскомнадзор может менять требования к трансграничным потокам; требуется регулярное обновление policy engine и запасной plan B (on-prem inference). Ссылка на DR2.5 критична.
- **Партнёрская готовность.** Marketplace требует мотивированных ISV. Необходимо заранее подготовить pipeline (Industry Catalyst Bundles + Partner Revenue Cockpit) и договориться о пилотах.
- **Человеческий фактор.** Два core участника ограничены по времени; нужно соблюдать приоритеты и не раздувать backlog. Fractional ресурсы следует планировать заранее.
- **Технологические риски.** Сценарии change automation и voice companion требуют дополнительных тестов и обучения пользователей; неправильно внедрённая автоматизация может вызвать инциденты.

## Финальные рекомендации для Клиента (Векус)
1. **Совместно с руководством Векуса утвердить фазовый план Ignite → Expansion.** Назначить владельцев KPI, зафиксировать доступы к данным и согласовать календарь фаз.
2. **Закрепить пилотный «топ-10» backlog.** Подтвердить, что Console Copilot, Incident War Room, Launchpad, Compliance Guardrail, Cost Anomaly, FinOps Copilot, Sandbox, Trust Center, Billing Copilot и Learning Loop — первый волновой набор.
3. **Использовать Discovery Catalog как проспект для руководства Векуса.** Карточки из {{doc:discovery_catalog_table_referenced|discovery_catalog_table_referenced.ru}} оформить в формат pre-sales («проблема → стек → эффект») и включать в рабочие сессии с топ-менеджментом.
4. **Легализовать комплаенс-требования.** Встроить DR2.5 checklist в Launchpad/Sandbox так, чтобы каждый сценарий автоматически формировал журналы 152‑ФЗ.
5. **Связать backlog с финансовой моделью DR3.** Каждой фиче сопоставить метрики MTTR, GMV, штрафов и обновлять ROI после релизов.
6. **Запустить непрерывный feedback loop.** С фазы Foundation включить Learning Loop Analytics, чтобы измерять использование Copilot/Marketplace и корректировать roadmap по факту.

## Источники
- {{doc:dr2_solution_pathing|DR2 — Карта решений и портфель развития}} и {{doc:dr2_solution_pathing|DR2 — Карта решений и портфель развития}} — краткое изложение портфеля и roadmap.
- {{doc:discovery_catalog_table_referenced|discovery_catalog_table_referenced.ru}} и {{doc:discovery_catalog_draft|Discovery Catalog — черновой список решений (RU)}} — полный каталог решений и атрибуты.
- {{doc:roadmap_draft|Черновик флагманской дорожной карты}} — фазовый план Ignite → Expansion с метриками.
- {{doc:dr2_decision_log|DR2 — Журнал решений}} и {{doc:brief_strategy|DR2 Solution Pathing — бриф и стратегия}} — критерии выбора, альтернативы, risk mitigations.
- {{doc:staffing_model_draft|Staffing & Operating Model — черновик}}, {{doc:current_schema|Infra Pitch — рабочая схема (05.11.2025)}} — операционная модель дуэта и используемый стек.
- {{doc:macro_landscape|Макроландшафт — AI-инфраструктура и агентные платформы (ноябрь 2025)}}, {{doc:akm_selectel_ifrs_summary|Selectel — ключевые финпоказатели (IFRS/RAS)}}, {{doc:tadviser_selectel_highlights|Selectel — ключевые факты из TAdviser (2021–2025)}} — рыночные сигналы и инвестиции российских провайдеров.
- {{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}, {{doc:dr2_5_compliance_checklist|DR2.5 — Чек-лист соответствия трансграничным нагрузкам}} — требования 152‑ФЗ и чек-листы для marketplace.
- {{doc:dr3_value_pricing|DR3 — Ценность, ценообразование и модель ROI}}, {{doc:dr3_pricing_table|Сводная таблица ценовых сценариев}} — связь решений с финансовыми сценариями.
