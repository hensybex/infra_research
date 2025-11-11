# Infra Pitch Package — план

## Итоговые артефакты для Векуса
- **Pitch Deck / Overview.** Короткая история о том, как мульти-оркестраторный стек закрывает болевые точки Векуса и где он даёт выигрыш по скорости.
- **Solution Playbook.** Roadmap с наборами AI-продуктов (консольный ассистент, marketplace, резидентская программа) и привязкой к фазам Ignite → Expansion.
- **Technical Skinny.** Набор схем: ядро оркестратора, MCP/LLM-инфраструктура, мобильные и векторные слои, каналы observability/guardrails.
- **Product Catalogue.** Каталог минимум из 20 модулей с указанием целевой роли, ценности и требуемых компонентов.
- **Financial & ROI Doc.** Сравнение 15 млн ₽ retainer-модели с альтернативами, ключевые метрики эффекта и риски.
- **Appendix.** Портфолио, биографии, описание процессов, выдержки доказательной базы DR1.

## Последовательность работ
1. **DR1 — Architecture Validation.** Сбор международных референсов, подтверждение соответствия стека российским ограничениям, формирование архитектурного нарратива.
2. **DR2 — Solution Pathing.** Подготовка каталога решений и фазовой программы, выделение quick wins и потоков для витрины; выпуск RU/ENG пакетов (`assets/rus/reports/DR2_solution_pathing.ru.md`, `assets/eng/reports/DR2_solution_pathing.md`).
3. **DR3 — Value & Pricing.** Построение модели затрат/ROI на базе DR2, расчёт retainer + success fee, подготовка RU/ENG отчётов (`assets/rus/reports/DR3_value_pricing.ru.md`, `assets/eng/reports/DR3_value_pricing.md`).
4. **Packaging.** Сбор master pack (deck + playbook + tech + финансы) и сокращённых форматов (OnePager, executive email).
5. **Review.** Финальная сверка сообщений, обновление `graph-index.md`, связывание с витриной кейсов.

## Контрольные пометки
- Все первичные источники и выписки сохраняются в `sources/`, рабочие заметки — в `rus/notes/` и `eng/notes/`.
- Цепочка DR1 → DR2 → DR3 должна укладываться в ≤10 рабочих дней, чтобы вовремя подготовить лендинг и клиентский пакет.
