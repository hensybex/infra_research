# Staffing & Operating Model — черновик

## Команда (2 человека)
- **Продукт/стратегия:** discovery, roadmap, GTM партнёров, комплаенс-нарратив, управление marketplace.
- **Инженер/архитектор:** MCP-оркестрация, Dagger-пайплайны, интеграции с мониторингом/биллингом, автоматизация поставки.

## Ритм
- **Еженедельно:** совместный бэклог Console Copilot, Marketplace, Support Modules; 2–3 цели спринта.
- **Ежедневно:** 30-мин синк по блокерам + async обновления в MCP-канале.
- **Ежемесячно:** демо для руководства с метриками (MTTR, темп онбординга, покрытие комплаенса).

## Расширенный контур
- **Фракционные специалисты:** 0.5 FTE дизайн на UI фазы 1/2; 0.25 FTE юрист/комплаенс для marketplace-гейтинга.
- **Partner guild:** использовать существующих Customer/Partner Success для валидации витрины.

## Стек инструментов
- MCP-оркестратор, Dagger CI/CD, vector store (Milvus/Weaviate), DuckDB/Snowflake, Grafana/Looker.
- Коллаборация через Notion/Confluence, Linear/Jira, GitHub (рабочие процессы в духе Agent HQ, см. `assets/rus/notes/theverge_github_agent_hq_summary.ru.md`).

## Распределение времени
- 40% — Console Copilot & runbooks.
- 35% — Marketplace (онбординг, tooling).
- 15% — Support modules (compliance, billing).
- 10% — Метрики и enablement.

## Модель взаимодействия
- Lean discovery с пилотами marketplace.
- Максимум переиспользуемой автоматизации (Pipeline Studio, Learning Loop) при ограниченном штате.
- Цикл build→measure→learn жёстко привязан к панели метрик из roadmap (`assets/rus/notes/roadmap_draft.ru.md`).
