# Launch Blueprint — Full Solution Pathing & Delivery Routes

## Executive Summary
- A 30-item portfolio is grouped into four clusters (Operations Nerve Center, Marketplace Growth, Compliance & Trust, Ecosystem Intelligence) and sequenced across Ignite → Foundation → Pilot Scale → Expansion ({{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}}, {{doc:roadmap_draft|Flagship Roadmap Draft}}).
- North Star stays intact: MTTR −40%, ≥20 marketplace offers, Trust Center ≤5 days, transparent FinOps. Every solution ties to these KPIs with explicit tech (MCP, Dagger, vector DBs, policy engine), so the client sees “feature → KPI” ({{doc:dr2_solution_pathing|DR2 — Solution Pathing & Growth Portfolio}}).
- Operating model for the duo (40% Console Copilot, 35% Marketplace, 15% Support, 10% Enablement) keeps velocity without hiring, while fractional experts are preplanned ({{doc:staffing_model_draft|Staffing & Operating Model — draft}}).
- The Discovery Catalog is a sales + delivery artifact: each entry has purpose, stack, effort, and “why this duo” pitch—useful for pre-sales and team loading.
- Compliance stream is embedded everywhere: automated 152-FZ checks, Evidence Vault, BRICS-ready contours, and Roskomnadzor rituals from DR2.5 sit inside Launchpad, Sandbox, Trust Center ({{doc:dr2_5_compliance_checklist|DR2.5 — Cross-Border Checklist}}, {{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}).

## Context & Goal
DR2 explains **what** we build and **in what order**. After DR1 validated architecture, the client wants concrete scenarios proving commercial upside and risk control. Backlog must cover operations, sales, finance, compliance yet remain executable by two principal builders. Inputs: {{doc:dr2_solution_pathing|DR2 — Solution Pathing & Growth Portfolio}}, {{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}}, {{doc:roadmap_draft|Flagship Roadmap Draft}}, {{doc:dr2_decision_log|DR2 Decision Log}}, plus notes like macro_landscape and akm_selectel_ifrs_summary. Result: a self-contained guide from high-level summary to tables, value streams, risks, linked artifacts.

## Key Findings
1. **Console Copilot + Marketplace Launchpad are the core.** Everything else either feeds them with data (FinOps, Observability) or boosts trust (Compliance Guardrail, Trust Center).
2. **Discovery Catalog hits real pains.** Incident War Room, Billing Copilot, GPU Optimizer, Migration Translator and others mirror workloads of Selectel/Timeweb-style providers—not abstract cases.
3. **Program follows “data → automation → commercialization”.** Ignite unlocks telemetry/billing, Foundation introduces automation + Launchpad, Pilot Scale brings marketplace + voice/mobile, Expansion cements Trust Center, bundles, edge planning.

### Delivery Streams & Staffing
- **Streams:** Console Copilot (40%), Marketplace (35%), Support modules (15%), Enablement (10%) ({{doc:staffing_model_draft|Staffing & Operating Model — draft}}).
- **Rituals:** daily 30-min standups, weekly backlog review, monthly executive demos—keeps Legal and Sales aligned.
- **Fractional support:** part-time designer (0.5 FTE) during Foundation/Pilot, localization counsel (0.25 FTE) during Launchpad/Trust Center.
- **Toolchain:** MCP, Dagger, Milvus/Weaviate, DuckDB/Snowflake, Grafana/Looker, GitHub Agent HQ-style governance ({{doc:current_schema|Infra Pitch — work schema}}, {{doc:theverge_github_agent_hq_summary|GitHub Agent HQ — The Verge}}).

### Discovery → Delivery Mechanics
1. **Scoping:** each catalog entry ships with a one-pager (KPI, dependencies) ({{doc:dr2_solution_pathing|DR2 — Solution Pathing & Growth Portfolio}}).
2. **Gating:** filters ensure alignment with North Star, data availability, built-in compliance. {{doc:dr2_decision_log|DR2 Decision Log}} records choices & deferred ideas.
3. **Build loops:** every feature moves through read → recommend → execute; automation only switches on after Copilot proves reliable in read/suggest modes (roadmap dependencies + mitigation plan).
4. **Feedback:** Learning Loop Analytics + Community Knowledge Graph capture usage, NPS, incidents (#29–30 in catalog).
5. **Commercialization:** Launchpad + Trust Center record GMV/take rate and ingest DR2.5 compliance. FinOps modules route the data into DR3 ROI.

### Relationship to DR1 & DR3
- DR1 proved architecture + market appetite; DR2 materializes it into concrete products.
- DR3 consumes these modules’ metrics: ROI scenarios (₽72–330M value) rely on MTTR savings, marketplace GMV, compliance avoidance. Every DR2 feature tags its DR3 impact ({{doc:dr3_pricing_table|Pricing Table (Summary)}}, {{doc:dr3_value_pricing|DR3 Value, Pricing & ROI Model}}).

## Risks & Constraints
- **System access.** Copilot & Launchpad require monitoring/billing/CRM APIs. Lock in SOW + SLA ({{doc:roadmap_draft|Flagship Roadmap Draft}}).
- **Compliance shifts.** Roskomnadzor may change cross-border rules; keep policy engine updated and on-prem fallback ready.
- **Partner readiness.** Marketplace needs motivated ISVs; prep Industry Bundles + Partner Revenue Cockpit to recruit pilots.
- **Human load.** Duo capacity is finite—guard priorities, schedule fractional help.
- **Tech risk.** Change automation / voice companion needs extra testing + enablement; rushed automation could trigger incidents.

## Final Recommendations for Vekus
1. **Align the Ignite → Expansion phase plan with Vekus leadership.** Assign KPI owners, lock data-access scope, and agree on the phase cadence.
2. **Ratify the “top 10” pilot backlog.** Confirm Console Copilot, Incident War Room, Launchpad, Compliance Guardrail, Cost Anomaly, FinOps Copilot, Sandbox, Trust Center, Billing Copilot, and Learning Loop as the first wave.
3. **Use the Discovery Catalog as the executive prospectus.** Convert {{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}} cards into “problem → stack → impact” one-pagers for stakeholder sessions.
4. **Bake compliance/legal into Launchpad & Sandbox.** Apply the DR2.5 checklist so every submission auto-generates 152-FZ logs and approvals.
5. **Map backlog items to the DR3 financial model.** Link each feature to MTTR, GMV, or penalty metrics and refresh ROI after every release.
6. **Enable continuous feedback loops.** Starting in Foundation, run Learning Loop Analytics to measure Console Copilot/Marketplace usage and adjust the roadmap.

## Sources
- {{doc:dr2_solution_pathing|DR2 — Solution Pathing & Growth Portfolio}} — portfolio overview.
- {{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}}, {{doc:discovery_catalog_draft|Discovery Catalog — RU draft}} — detailed catalog.
- {{doc:roadmap_draft|Flagship Roadmap Draft}} — Ignite → Expansion phases.
- {{doc:dr2_decision_log|DR2 Decision Log}}, {{doc:brief_strategy|DR2 solution briefing}} — selection criteria & mitigations.
- {{doc:staffing_model_draft|Staffing & Operating Model — draft}}, {{doc:current_schema|Infra Pitch — work schema}} — operating model + stack.
- {{doc:macro_landscape|Macro Landscape – AI Infrastructure & Agent Platforms (Nov 2025)}}, {{doc:akm_selectel_ifrs_summary|Selectel — IFRS / RAS snapshot}}, {{doc:tadviser_selectel_highlights|Selectel highlights}} — market signals.
- {{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}, {{doc:dr2_5_compliance_checklist|DR2.5 — Cross-Border Checklist}} — compliance requirements.
- {{doc:dr3_value_pricing|DR3 Value, Pricing & ROI Model}}, {{doc:dr3_pricing_table|Pricing Table (Summary)}} — financial linkage.
