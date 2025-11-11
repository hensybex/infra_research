## Задача: ревизия и синхронизация исследовательских документов

### Контекст
- Переводы уже разнесены по `assets/rus/...` и `assets/eng/...`.
- Требуется убедиться, что весь контент в приложении сосуществует с исходными материалами из `/Users/hensybex/Desktop/deep_researches`.

### План для отдельной сессии
1. **Индекс ссылок внутри отчётов**
   - Прогнать `rg` (или аналог) по всем `assets/{rus,eng}/reports/*.md`, вытащить каждое упоминание `notes/...`, `reports/...`, `sources/...`.
   - Построить таблицу вида: `файл → упомянутые .md / .csv`.

2. **Проверка наличия**
   - Сверить список упоминаний с фактическим деревом `assets/{rus,eng}/**/*.md`.
   - Отдельно отметить отсутствующие файлы или несоответствия (например, если упоминается `.md`, а есть только `.csv`).

3. **Сопоставление с оригиналами**
   - В директории `/Users/hensybex/Desktop/deep_researches` лежат наборы:
     - `20251105-122703-1-architecture-validation-sd8d`
     - `20251105-133642-2-solution-pathing-xst4`
     - `20251105-145838-2-5-market-access-wnjl`
     - `20251105-145914-3-value-pricing-lbqy`
   - Нужно пройтись по подпапкам, перечислить исходные файлы (md/pdf/csv/и т.д.) и понять, какие из них уже перенесены в `assets`, а какие нет.

4. **Финальное резюме**
   - Составить список «что переносим и откуда»: источник (оригинальный путь), целевой язык/папка (`assets/rus/...` или `assets/eng/...`), статус (есть/нет/нужно обновить).
   - Вынести приоритеты: сначала критичные ссылки, которые ломаются в приложении, потом вспомогательные материалы.

### Ожидаемый результат
- Таблица или список с полным покрытием всех упоминаний и их фактическим наличием.
- Карта соответствий между папками из `deep_researches` и текущими ассетами.
- Чёткий перечень файлов, которые нужно перенести или восстановить в следующей итерации.

---

## Срез сессии 2025-11-07 · аудит ссылок `.md/.csv`

### 1. Report → referenced `.md/.csv`
| Report | Referenced .md/.csv |
| --- | --- |
| `assets/eng/reports/DR1_architecture_validation.md` | 20251104_anthropic_mcp.md<br>20251104_asiatech_shisa.md<br>20251104_aws_bedrock_guardrails.md<br>20251104_azure_foundry_mcp_infoq.md<br>20251104_cnbctv18_korea_budget_ai.md<br>20251104_eweek_meta_ai_spending.md<br>20251104_forethought_case_study.md<br>20251104_github_agent_hq_infoworld.md<br>20251104_openai_agentkit_techcrunch.md<br>20251104_thetech_almaty.md |
| `assets/eng/reports/DR1_architecture_validation_full.md` | .ru.md<br>eng/notes/DR2_5_compliance_checklist.md<br>eng/notes/akm_selectel_ifrs_summary.md<br>eng/notes/current_schema.md<br>eng/notes/discovery_catalog_draft.md<br>eng/notes/discovery_catalog_table_referenced.md<br>eng/notes/macro_landscape.md<br>eng/notes/mts_marketplace_news_summary.md<br>eng/notes/overall_plan.md<br>eng/notes/roadmap_draft.md<br>eng/notes/staffing_model_draft.md<br>eng/notes/tadviser_selectel_highlights.md<br>eng/reports/DR1_architecture_validation.md<br>eng/reports/DR2_5_market_access.md |
| `assets/eng/reports/DR2_5_market_access.md` | — |
| `assets/eng/reports/DR2_5_market_access_full.md` | eng/notes/DR2_5_compliance_checklist.md<br>eng/notes/discovery_catalog_table_referenced.md<br>eng/notes/macro_landscape.md<br>eng/notes/mts_marketplace_news_summary.md<br>eng/reports/DR2_5_market_access.md<br>eng/reports/DR2_solution_pathing.md |
| `assets/eng/reports/DR2_solution_pathing.md` | artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md<br>eng/notes/akm_selectel_ifrs_summary.md<br>eng/notes/azure_ai_foundry_future_agents_summary.md<br>eng/notes/macro_landscape.md<br>eng/notes/roadmap_draft.md<br>eng/notes/staffing_model_draft.md<br>eng/notes/tadviser_selectel_highlights.md<br>eng/notes/theverge_github_agent_hq_summary.md<br>eng/notes/wiki_data_localization_russia.md<br>eng/notes/wiki_selectel_summary.md |
| `assets/eng/reports/DR2_solution_pathing_full.md` | Notes/DR2_decision_log.md<br>eng/notes/DR2_5_compliance_checklist.md<br>eng/notes/DR2_decision_log.md<br>eng/notes/DR3_pricing_table.md<br>eng/notes/akm_selectel_ifrs_summary.md<br>eng/notes/brief_strategy.md<br>eng/notes/current_schema.md<br>eng/notes/discovery_catalog_draft.md<br>eng/notes/discovery_catalog_table_referenced.md<br>eng/notes/macro_landscape.md<br>eng/notes/roadmap_draft.md<br>eng/notes/staffing_model_draft.md<br>eng/notes/tadviser_selectel_highlights.md<br>eng/notes/theverge_github_agent_hq_summary.md<br>eng/reports/DR2_5_market_access.md<br>eng/reports/DR2_solution_pathing.md<br>eng/reports/DR2_solution_pathing.md/.ru.md<br>eng/reports/DR3_value_pricing.md |
| `assets/eng/reports/DR3_value_pricing.md` | eng/notes/DR3_pricing_table.csv<br>eng/notes/DR3_value_model_results.md |
| `assets/eng/reports/DR3_value_pricing_full.md` | DR3_pricing_table.csv<br>eng/notes/DR3_pricing_table.csv<br>eng/notes/DR3_pricing_table.md<br>eng/notes/DR3_pricing_table.md/.csv<br>eng/notes/DR3_value_pricing.md<br>eng/notes/akm_selectel_ifrs_summary.md<br>eng/notes/roadmap_draft.md<br>eng/notes/staffing_model_draft.md<br>eng/notes/tadviser_selectel_highlights.md<br>eng/reports/DR1_architecture_validation.md<br>eng/reports/DR2_5_market_access.md<br>eng/reports/DR2_solution_pathing.md<br>eng/reports/DR3_value_pricing.md<br>eng/reports/DR3_value_pricing.md/.ru.md |
| `assets/rus/reports/DR1_architecture_validation.ru.md` | 20251104_anthropic_mcp.md<br>20251104_asiatech_shisa.md<br>20251104_aws_bedrock_guardrails.md<br>20251104_azure_foundry_mcp_infoq.md<br>20251104_cnbctv18_korea_budget_ai.md<br>20251104_eweek_meta_ai_spending.md<br>20251104_forethought_case_study.md<br>20251104_github_agent_hq_infoworld.md<br>20251104_openai_agentkit_techcrunch.md<br>20251104_thetech_almaty.md |
| `assets/rus/reports/DR1_architecture_validation_full.ru.md` | .ru.md<br>rus/notes/DR2_5_compliance_checklist.ru.md<br>rus/notes/akm_selectel_ifrs_summary.ru.md<br>rus/notes/current_schema.ru.md<br>rus/notes/discovery_catalog_draft.ru.md<br>rus/notes/discovery_catalog_table_referenced.ru.md<br>rus/notes/macro_landscape.ru.md<br>rus/notes/mts_marketplace_news_summary.ru.md<br>rus/notes/overall_plan.ru.md<br>rus/notes/roadmap_draft.ru.md<br>rus/notes/staffing_model_draft.ru.md<br>rus/notes/tadviser_selectel_highlights.ru.md<br>rus/reports/DR1_architecture_validation.ru.md<br>rus/reports/DR2_5_market_access.ru.md |
| `assets/rus/reports/DR2_5_market_access.ru.md` | — |
| `assets/rus/reports/DR2_5_market_access_full.ru.md` | rus/notes/DR2_5_compliance_checklist.ru.md<br>rus/notes/discovery_catalog_table_referenced.ru.md<br>rus/notes/macro_landscape.ru.md<br>rus/notes/mts_marketplace_news_summary.ru.md<br>rus/reports/DR2_5_market_access.ru.md<br>rus/reports/DR2_solution_pathing.ru.md |
| `assets/rus/reports/DR2_solution_pathing.ru.md` | artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md<br>rus/notes/akm_selectel_ifrs_summary.ru.md<br>rus/notes/azure_ai_foundry_future_agents_summary.ru.md<br>rus/notes/macro_landscape.ru.md<br>rus/notes/roadmap_draft.ru.md<br>rus/notes/staffing_model_draft.ru.md<br>rus/notes/tadviser_selectel_highlights.ru.md<br>rus/notes/theverge_github_agent_hq_summary.ru.md<br>rus/notes/wiki_data_localization_russia.ru.md<br>rus/notes/wiki_selectel_summary.ru.md |
| `assets/rus/reports/DR2_solution_pathing_full.ru.md` | Notes/DR2_decision_log.md<br>rus/notes/DR2_5_compliance_checklist.ru.md<br>rus/notes/DR2_decision_log.ru.md<br>rus/notes/DR3_pricing_table.ru.md<br>rus/notes/akm_selectel_ifrs_summary.ru.md<br>rus/notes/brief_strategy.ru.md<br>rus/notes/current_schema.ru.md<br>rus/notes/discovery_catalog_draft.ru.md<br>rus/notes/discovery_catalog_table_referenced.ru.md<br>rus/notes/macro_landscape.ru.md<br>rus/notes/roadmap_draft.ru.md<br>rus/notes/staffing_model_draft.ru.md<br>rus/notes/tadviser_selectel_highlights.ru.md<br>rus/notes/theverge_github_agent_hq_summary.ru.md<br>rus/reports/DR2_5_market_access.ru.md<br>rus/reports/DR2_solution_pathing.ru.md<br>rus/reports/DR2_solution_pathing.ru.md/.ru.md<br>rus/reports/DR3_value_pricing.ru.md |
| `assets/rus/reports/DR3_value_pricing.ru.md` | rus/notes/DR3_pricing_table.csv<br>rus/notes/DR3_value_model_results.md |
| `assets/rus/reports/DR3_value_pricing_full.ru.md` | DR3_pricing_table.csv<br>rus/notes/DR3_pricing_table.csv<br>rus/notes/DR3_pricing_table.ru.md<br>rus/notes/DR3_pricing_table.ru.md/.csv<br>rus/notes/DR3_value_pricing.md<br>rus/notes/akm_selectel_ifrs_summary.ru.md<br>rus/notes/roadmap_draft.ru.md<br>rus/notes/staffing_model_draft.ru.md<br>rus/notes/tadviser_selectel_highlights.ru.md<br>rus/reports/DR1_architecture_validation.ru.md<br>rus/reports/DR2_5_market_access.ru.md<br>rus/reports/DR2_solution_pathing.ru.md<br>rus/reports/DR3_value_pricing.ru.md<br>rus/reports/DR3_value_pricing.ru.md/.ru.md |

### 2. Ломанные ссылки и что с ними делать (25 шт.)
| Reference | Reports | Источник / расположение | Что делать |
| --- | --- | --- | --- |
| `.ru.md` | DR1_architecture_validation_full (eng+rus) | нет файла, служебный хвост от шаблона ссылки | убрать хвост `.ru.md` из маркдауна |
| `20251104_anthropic_mcp.md` | DR1_architecture_validation (eng+rus) | `deep_researches/hensybex/projects/infra_pitch/sources/DR1/20251104_anthropic_mcp.md` | скопировать в `assets/{eng,rus}/sources` и обновить ссылку |
| `20251104_asiatech_shisa.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_asiatech_shisa.md` | то же |
| `20251104_aws_bedrock_guardrails.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_aws_bedrock_guardrails.md` | то же |
| `20251104_azure_foundry_mcp_infoq.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_azure_foundry_mcp_infoq.md` | то же |
| `20251104_cnbctv18_korea_budget_ai.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_cnbctv18_korea_budget_ai.md` | то же |
| `20251104_eweek_meta_ai_spending.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_eweek_meta_ai_spending.md` | то же |
| `20251104_forethought_case_study.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_forethought_case_study.md` | то же |
| `20251104_github_agent_hq_infoworld.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_github_agent_hq_infoworld.md` | то же |
| `20251104_openai_agentkit_techcrunch.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_openai_agentkit_techcrunch.md` | то же |
| `20251104_thetech_almaty.md` | DR1_architecture_validation (eng+rus) | `.../sources/DR1/20251104_thetech_almaty.md` | то же |
| `DR3_pricing_table.csv` | DR3_value_pricing_full (eng+rus) | файл уже лежит в `assets/eng/notes/DR3_pricing_table.csv` | переписать ссылки на `eng/notes/...` (и добавить русскую версию) |
| `Notes/DR2_decision_log.md` | DR2_solution_pathing_full (eng+rus) | файл уже есть как `assets/eng/notes/DR2_decision_log.md` | поправить регистр/путь на `eng/notes/DR2_decision_log.md` |
| `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md` | DR2_solution_pathing (eng+rus) | оригинал в `deep_researches/20251105-133642-2-solution-pathing-xst4/artifacts/scrape/...` | решить хранение (скопировать в assets/sources или удалить ссылку) |
| `eng/notes/DR3_pricing_table.md/.csv` | DR3_value_pricing_full (eng) | нет такого пути, csv хранится отдельно | поправить ссылку на `eng/notes/DR3_pricing_table.csv` |
| `eng/notes/DR3_value_model_results.md` | DR3_value_pricing (eng) | `deep_researches/20251105-145914-3-value-pricing-lbqy/notes/DR3_value_model_results.md` | перенести в `assets/eng/notes` и обновить ссылку |
| `eng/notes/DR3_value_pricing.md` | DR3_value_pricing_full (eng) | фактический файл `assets/eng/reports/DR3_value_pricing.md` | исправить путь на `eng/reports/...` или продублировать в notes |
| `eng/reports/DR2_solution_pathing.md/.ru.md` | DR2_solution_pathing_full (eng) | некорректный комбинированный путь | удалить хвост `/.ru.md` |
| `eng/reports/DR3_value_pricing.md/.ru.md` | DR3_value_pricing_full (eng) | некорректный комбинированный путь | удалить хвост `/.ru.md` |
| `rus/notes/DR3_pricing_table.csv` | DR3_value_pricing (rus) + DR3_value_pricing_full (rus) | русская таблица не создана (оригинал только на англ) | перевести `DR3_pricing_table.csv` → `assets/rus/notes/...` и обновить ссылку |
| `rus/notes/DR3_pricing_table.ru.md/.csv` | DR3_value_pricing_full (rus) | комбинированный путь (md/.csv) | разделить ссылки на `.md` и `.csv` |
| `rus/notes/DR3_value_model_results.md` | DR3_value_pricing (rus) | нет файла, есть только англ оригинал `notes/DR3_value_model_results.md` | перевести и положить в `assets/rus/notes` |
| `rus/notes/DR3_value_pricing.md` | DR3_value_pricing_full (rus) | нет отдельного note, есть `rus/reports/DR3_value_pricing.ru.md` | или поправить ссылку на `rus/reports/...`, или создать note |
| `rus/reports/DR2_solution_pathing.ru.md/.ru.md` | DR2_solution_pathing_full (rus) | хвост `/.ru.md` | удалить |
| `rus/reports/DR3_value_pricing.ru.md/.ru.md` | DR3_value_pricing_full (rus) | хвост `/.ru.md` | удалить |

### 3. Оригиналы (`deep_researches`) → статус переноса
#### 20251105-122703-1-architecture-validation-sd8d (DR1)
- ✅ Уже в assets: пока нет совпадений по именам `.md/.csv`.
- ⛔ Только в исходниках: `notes/00_scope.md`, `notes/01_macro_scan.md`, `notes/compact_teams/20251105_nightcafe_four_person_team.md`, `notes/compact_teams/20251105_pinterest_two_person_team.md`, `notes/compact_teams/20251105_prairiecode_quote.md`, `notes/extracts/20251105_build_andrew_ng.md`, `notes/extracts/20251105_cio_agentic_workflows.md`, `notes/extracts/20251105_habr_mcp_ru.md`, `notes/extracts/20251105_jetbrains_envbench.md`, `notes/extracts/20251105_openai_devday_mcp.md`, `notes/market_signals/20251105_agentic_ai_market_forecast.md`, `notes/market_signals/20251105_ai_compensation_premiums.md`, `notes/market_signals/20251105_avito_ai_investment_ru.md`, `notes/pillar1_industry.md`, `notes/pillar1_industry_newrelic.md`, `notes/pillar2_leaders.md`, `research_log.md`. Эти материалы ещё никуда не экспортировались.

#### 20251105-133642-2-solution-pathing-xst4 (DR2)
- ✅ Уже в assets: `notes/akm_selectel_ifrs_summary.md`, `notes/azure_ai_foundry_future_agents_summary.md`, `notes/brief_strategy.md`, `notes/discovery_catalog_draft.md`, `notes/discovery_catalog_table_referenced.md`, `notes/github_agent_hq_summary.md` (eng), `notes/macro_landscape.md`, `notes/mts_marketplace_news_summary.md`, `notes/roadmap_draft.md`, `notes/staffing_model_draft.md`, `notes/tadviser_selectel_highlights.md`, `notes/theverge_github_agent_hq_summary.md`, `notes/wiki_data_localization_russia.md`, `notes/wiki_selectel_summary.md`, а также `hensybex/projects/infra_pitch/notes/DR2_decision_log.md` → `assets/eng/notes/DR2_decision_log.md` и `.../reports/DR2_solution_pathing.md` → `assets/eng/reports/DR2_solution_pathing.md`.
- ⛔ Только в исходниках: `artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md`, `notes/aws_partner_agent_factory_summary.md`, `notes/kingservers_oct2025_cloud_digest_summary.md`, `notes/loc_russia_data_localization_summary.md`, `notes/privacypolicies_russia_data_summary.md`, `notes/tadviser_timeweb_highlights.md`, `notes/timeweb_cloud_roadmap_summary.md`, `notes/wiki_internet_restrictions_data_localization.md`, `notes/wiki_personal_data_russia_summary.md`, `notes/wiki_timeweb_summary.md`, `research_log.md` и HTML-источники из `artifacts/raw/` + JSON из `artifacts/search/`. Их надо либо перенести в `assets/sources`, либо зафиксировать отказ от публикации.

#### 20251105-145838-2-5-market-access-wnjl (DR2.5)
- ✅ Уже в assets: ещё нет прямых совпадений по именам.
- ⛔ Только в исходниках: `notes/opportunity.md`, `notes/overview.md`, `reports/final_report.md`, `research_log.md` плюс все HTML-`artifacts/raw`. Сюда же относятся материалы по RKN/FZ-152, которые фигурируют в отчёте, но не перенесены как отдельные заметки.

#### 20251105-145914-3-value-pricing-lbqy (DR3)
- ✅ Уже в assets: `notes/DR3_pricing_table.md` → `assets/eng/notes/DR3_pricing_table.md`, `notes/DR3_pricing_table.csv` → `assets/eng/notes/DR3_pricing_table.csv`.
- ⛔ Только в исходниках: `notes/DR3_alternatives.md`, `notes/DR3_benchmark_sources.md`, `notes/DR3_brief.md`, `notes/DR3_macro_scan.md`, `notes/DR3_pricing_strategy.md`, `notes/DR3_risks_assumptions.md`, `notes/DR3_value_model_inputs.md`, `notes/DR3_value_model_results.md`, `research_log.md`. Их нужно портировать (и перевести для русской версии) перед публикацией Value Pricing Full/RU.
