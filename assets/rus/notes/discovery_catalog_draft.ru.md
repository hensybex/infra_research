# Discovery Catalog — черновой список решений (RU)

1. **Console Copilot Core**
   - ЦА: NOC/SRE.
   - Ценность: разговорное окно для runbook-ов, статусов и автоматизаций.
   - Стек: MCP-оркестратор, векторная память, API Selectel/Timeweb, OpenTelemetry, RAG-дэшборды.
   - Усилие: среднее.
   - Рефы: `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`, `assets/rus/notes/theverge_github_agent_hq_summary.ru.md`.
2. **Incident War Room Summaries**
   - ЦА: руководители инцидентов.
   - Ценность: лайв-таймлайны, рекомендации и follow-up тикеты во время аварий.
   - Стек: потоковые логи, LLM-саммари, PagerDuty/Zabbix, Teams/Telegram.
   - Усилие: среднее.
   - Рефы: `assets/rus/notes/theverge_github_agent_hq_summary.ru.md`.
3. **Compliance Guardrail Advisor**
   - ЦА: команды комплаенса облака.
   - Ценность: автоматическая проверка рабочих нагрузок и офферов marketplace на соответствие локализации РФ.
   - Стек: policy-engine, векторная база 152‑ФЗ, MCP-коннекторы к инвентарю, аудит-лог.
   - Усилие: среднее.
   - Рефы: `assets/rus/notes/wiki_data_localization_russia.ru.md`.
4. **Cost Anomaly Radar**
   - ЦА: FinOps/CFO.
   - Ценность: детектирует биллинговые аномалии, тегирует AI-нагрузки, предлагает апсейлы marketplace.
   - Стек: Dagger+S3 ETL, аномалия, дашборд, уведомления.
   - Усилие: среднее.
   - Рефы: `assets/rus/notes/akm_selectel_ifrs_summary.ru.md`.
5. **Marketplace Launchpad**
   - ЦА: Partner Success.
   - Ценность: самообслуживание партнёров с тестами, юрпроверкой и упаковкой офферов.
   - Стек: воркфлоу-движок, vector QA, автоматический договорной чек, sandbox.
   - Усилие: высокое.
   - Рефы: `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`.
6. **GPU Allocation Optimizer**
   - ЦА: capacity planners.
   - Ценность: рекомендации по резервированию GPU и масштабированию под прогнозы.
   - Стек: lakehouse метрик, прогнозные модели, планировщик, консольный плагин.
   - Усилие: высокое.
   - Рефы: `assets/rus/notes/akm_selectel_ifrs_summary.ru.md`.
7. **Migration Script Translator**
   - ЦА: профессиональные сервисы.
   - Ценность: перевод Terraform/Ansible из AWS/Azure в эквиваленты Timeweb/Selectel.
   - Стек: агент перевода кода, диффинг, MCP-runner, Git.
   - Усилие: среднее.
   - Рефы: `assets/rus/notes/theverge_github_agent_hq_summary.ru.md`.
8. **Observability Storyboard**
   - ЦА: платформенные команды.
   - Ценность: нарратив, связывающий логи/трейсы/метрики с гипотезами RCA.
   - Стек: векторная корреляция телеметрии, граф-агент, UI-канвас.
   - Усилие: среднее.
   - Рефы: `assets/rus/notes/azure_ai_foundry_future_agents_summary.ru.md`.
9. **Partner Sandbox Orchestrator**
   - ЦА: ISV.
   - Ценность: one-click демо с эталонными данными, мониторингом и teardown.
   - Стек: MCP-автоматизация, Dagger-пайплайны, секреты, наблюдаемость.
   - Усилие: среднее.
   - Рефы: `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`.
10. **Sovereign Data Toolkit**
    - ЦА: compliance + GTM.
    - Ценность: готовые пайплайны, гарантирующие нахождение данных в РФ с аудитом.
    - Стек: контейнеризированные пайплайны, KMS, трекер резидентности, дашборд.
    - Усилие: высокое.
    - Рефы: `assets/rus/notes/wiki_data_localization_russia.ru.md`.
11. **Customer Onboarding Concierge**
    - ЦА: пресейл/SE.
    - Ценность: диалоговый intake, который собирает нагрузки, комплаенс и бюджет, выдаёт план.
    - Стек: чат-форма, генератор шаблонов, CRM-интеграция, уведомления.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/akm_selectel_ifrs_summary.ru.md`.
12. **Support Triage Copilot**
    - ЦА: сервис-деск.
    - Ценность: классифицирует тикеты, предлагает ответы, запускает скрипты.
    - Стек: ingest тикетов, RAG по базе знаний, MCP-скрипты, эскалации.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/theverge_github_agent_hq_summary.ru.md`.
13. **Marketplace Quality Scoring**
    - ЦА: ops marketplace.
    - Ценность: оценка офферов по комплаенсу, перформансу, отзывам.
    - Стек: агрегатор данных, модели скоринга, суммаризатор отзывов, аналитика.
    - Усилие: среднее.
    - Рефы: `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`.
14. **AI Solution Blueprint Library**
    - ЦА: партнёры/клиенты.
    - Ценность: каталоги готовых дизайнов по индустриям с запуском оркестраций.
    - Стек: генератор документации, векторный поиск, репозитории шаблонов, встраивание в консоль.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/azure_ai_foundry_future_agents_summary.ru.md`.
15. **Billing Intelligence Copilot**
    - ЦА: финансы.
    - Ценность: прогноз расходов, what-if сценарии, рекомендации по резервированию.
    - Стек: таймсерии, Dagger ETL, дашборд, чат.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/akm_selectel_ifrs_summary.ru.md`.
16. **Security Playbook Agent**
    - ЦА: SOC.
    - Ценность: исполняет runbook-и DDoS/бричей, показывает TI, трекает задачи.
    - Стек: SOAR, threat feeds, MCP-авто, логирование комплаенса.
    - Усилие: высокое.
    - Рефы: `assets/rus/notes/tadviser_selectel_highlights.ru.md`.
17. **Asset Lifecycle Tracker**
    - ЦА: DC Ops.
    - Ценность: цифровой двойник железа с прогнозом ТО.
    - Стек: интеграция с CMDB, датчики, предиктивные модели, UI.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/akm_selectel_ifrs_summary.ru.md`.
18. **Partner Revenue Cockpit**
    - ЦА: BizOps.
    - Ценность: KPI партнёров, пайплайн ко-сейла, триггеры стимулов.
    - Стек: DWH, KPI-методология, визуализации, алерт-агенты.
    - Усилие: среднее.
    - Рефы: `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`.
19. **Developer Launchpad Copilot**
    - ЦА: внешние разработчики.
    - Ценность: чатовый проводник по API, генерирует примеры кода, разворачивает песочницы.
    - Стек: загрузчик схем API, Git-шаблоны, интерактивная документация, MCP scaffolding.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/theverge_github_agent_hq_summary.ru.md`.
20. **Edge Placement Planner**
    - ЦА: solution architects.
    - Ценность: рекомендует размещение по задержкам и комплаенсу.
    - Стек: телеметрия сети, оптимизационные модели, карта, сценарное моделирование.
    - Усилие: высокое.
    - Рефы: `assets/rus/notes/tadviser_selectel_highlights.ru.md`.
21. **Industry Catalyst Bundles**
    - ЦА: vertical GTM.
    - Ценность: преднастроенные агентные воркфлоу для отраслей (ретейл, финтех KYC).
    - Стек: шаблонные пайплайны, комплаенс-доки, калькуляторы цен.
    - Усилие: среднее.
    - Рефы: `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`.
22. **Resident Program Tracker**
    - ЦА: экосистема партнёров.
    - Ценность: управление резидентскими стартапами, контроль бенефитов и менторства.
    - Стек: CRM-расширения, milestone-агент, отчёты.
    - Усилие: низкое.
    - Рефы: `assets/rus/notes/akm_selectel_ifrs_summary.ru.md`.
23. **Voice Ops Companion**
    - ЦА: полевые инженеры.
    - Ценность: голосовой ассистент для чеклистов, поиска активов, тикетов.
    - Стек: ASR/NLU, офлайн-синхронизация, управление устройствами, action scripts.
    - Усилие: высокое.
    - Рефы: `assets/rus/notes/azure_ai_foundry_future_agents_summary.ru.md`.
24. **AI Marketplace Trust Center**
    - ЦА: конечные клиенты.
    - Ценность: прозрачные скорборды по суверенности, производительности, биллингу для офферов.
    - Стек: ingestion данных, визуализации, аттестации, feedback loop.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/tadviser_selectel_highlights.ru.md`, `assets/rus/notes/wiki_data_localization_russia.ru.md`.
25. **MCP Pipeline Studio**
    - ЦА: внутренние автоматизаторы.
    - Ценность: low-code канвас для сборки MCP/Dagger пайплайнов с тестовым стендом.
    - Стек: визуальный редактор, компилятор пайплайнов, sandbox runner, реестр артефактов.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/theverge_github_agent_hq_summary.ru.md`.
26. **Observability Benchmark Exchange**
    - ЦА: аналитика marketplace.
    - Ценность: бенчмарки зрелости наблюдаемости партнёров + рекомендации.
    - Стек: телеметрия, скоринговые модели, генератор отчётов.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/azure_ai_foundry_future_agents_summary.ru.md`.
27. **AI Adoption Navigator**
    - ЦА: enterprise-клиенты.
    - Ценность: диагностический агент, который оценивает готовность к AI и выводит карту решений marketplace.
    - Стек: движок опросов, scoring rubric, маппинг к каталогу.
    - Усилие: среднее.
    - Рефы: `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`.
28. **Compliance Evidence Vault**
    - ЦА: юристы/комплаенс.
    - Ценность: хранение и экспорт доказательств от агентов и нагрузок.
    - Стек: неизменяемое хранилище, метаданные, экспортные воркфлоу.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/wiki_data_localization_russia.ru.md`.
29. **Learning Loop Analytics**
    - ЦА: продактовое руководство.
    - Ценность: метрики использования агентов, обратная связь, экспериментальные панели.
    - Стек: event pipeline, warehouse, дэшборды.
    - Усилие: низкое.
    - Рефы: `assets/rus/notes/theverge_github_agent_hq_summary.ru.md`.
30. **Community Knowledge Graph**
    - ЦА: сообщество/экосистема.
    - Ценность: граф знаний с инцидентами, скриптами, решениями для marketplace.
    - Стек: graph DB, портал, модерационные агенты.
    - Усилие: среднее.
    - Рефы: `assets/rus/notes/azure_ai_foundry_future_agents_summary.ru.md`.
