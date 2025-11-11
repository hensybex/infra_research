# Staffing & Operating Model Draft

## Team Structure (2-person core)
- **Product/Strategy Lead**: Owns client discovery, roadmap definition, partner GTM, compliance narrative, marketplace governance.
- **Engineer/Architect**: Owns MCP orchestration, Dagger pipelines, integration with monitoring/billing systems, delivery automation.

## Operating Rhythm
- **Weekly**: Joint backlog refinement across Console Copilot, Marketplace, Support Modules; define 2-3 sprint goals tied to roadmap phases.
- **Daily**: 30-min sync for blockers; async updates via internal MCP standup channel.
- **Monthly**: Executive showcase with metrics (MTTR, marketplace onboarding pace, compliance coverage).

## Extended Pod
- **Fractional Specialists**: Tap 0.5 FTE designer for UI polish during Phase 1/2; 0.25 FTE legal/compliance advisor for marketplace gating.
- **Partner Guild**: Leverage existing partner success managers for marketplace validation cycles.

## Tooling Stack Alignment
- MCP orchestrator, Dagger CI/CD pipelines, vector store (Milvus/Weaviate) for knowledge bases, DuckDB/Snowflake for analytics, Grafana/Looker for dashboards.
- Collaboration via Notion/Confluence, Linear/Jira, GitHub with Agent HQ-inspired workflows (eng/notes/theverge_github_agent_hq_summary.md).

## Capacity Allocation (Typical Week)
- 40% Console Copilot stream (automation, ops guardrails).
- 35% Marketplace stream (onboarding, partner tooling).
- 15% Support modules (compliance, billing intelligence).
- 10% Metrics/enablement/documentation.

## Engagement Model
- Lean discovery loops with pilot customers to validate marketplace bundles.
- Emphasis on reusable automation (Pipeline Studio, Learning Loop) to stretch limited headcount.
- Build/measure/learn cycles anchored to metrics dashboard defined in roadmap (eng/notes/roadmap_draft.md).
