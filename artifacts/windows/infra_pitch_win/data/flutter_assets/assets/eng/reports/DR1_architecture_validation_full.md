# Stack Proof — Full Architecture Validation of the Multi-Orchestrator Stack

## Executive Summary
- The MCP-based multi-orchestrator with Connector Registry + Evaluations is now an industry default (OpenAI AgentKit, Azure AI Foundry, GitHub Agent HQ) **and** mirrors what Russian infrastructure providers expect ({{doc:dr1_architecture_validation|DR1 — Proof Points for Multi-Orchestrator Engineering Stack}}, {{doc:macro_landscape|Macro Landscape – AI Infrastructure & Agent Platforms (Nov 2025)}}).
- The trio “orchestrator + guardrails + marketplace” hits MTTR, compliance, and monetization at once; compact teams like Forethought and Shisa.ai proved a two-person crew can sustain it ({{doc:dr1_architecture_validation|DR1 — Proof Points for Multi-Orchestrator Engineering Stack}}).
- Selectel’s +46% revenue jump, ₽10B AI capex, and state-backed localization budgets increase the value of this stack ({{doc:akm_selectel_ifrs_summary|Selectel — IFRS / RAS snapshot}}, {{doc:tadviser_selectel_highlights|Selectel highlights (TAdviser)}}, {{doc:macro_landscape|Macro Landscape – AI Infrastructure & Agent Platforms (Nov 2025)}}).
- Guardrails (AWS Automated Reasoning) + 152-FZ compliant Trust Center make it safe to ship marketplace and console in parallel ({{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}, {{doc:dr2_5_compliance_checklist|DR2.5 — Cross-Border Checklist}}).
- To preserve the edge we must fix pipelines in MCP Pipeline Studio, extend Connector Registry for RU APIs, and prep console/marketplace demos ({{doc:roadmap_draft|Flagship Roadmap Draft}}, {{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}}).

## Context & Goal
The client (Selectel / Timeweb caliber) is already investing in AI but needs proof that a compact duo can run the “operations nerve center” + marketplace without breaking residency rules or MTTR. After several short reports ({{doc:dr1_architecture_validation|DR1 — Proof Points for Multi-Orchestrator Engineering Stack}} etc.) they asked for a standalone Russian-language deep dive covering: practice sources, target architecture, market signals, launch guidance. DR1 must demonstrate the architecture aligns with global multi-orchestration trends (OpenAI, Azure, GitHub), fits local regulation, and is executable by a micro team. It also anchors DR2–DR3, so we include roadmap hooks, marketplace ties, and value-model pointers ({{doc:overall_plan|Infra Pitch Package — plan}}, {{doc:roadmap_draft|Flagship Roadmap Draft}}).

## Key Findings
1. **Architecture = orchestrator + registry + evals.** MCP servers orchestrate workflows, Connector Registry manages secrets and health, Evaluations/Guardrails enforce quality. This pattern underpins Console Copilot, Launchpad, and FinOps copilots.
2. **Marketplace monetization is native.** Launchpad, Partner Sandbox Orchestrator, Industry Catalyst Bundles, Trust Center combine to turn the architecture into paid offerings (Discovery Catalog items 5, 9, 21, 24).
3. **Compliance is productized.** Compliance Guardrail Advisor, Sovereign Data Toolkit, Evidence Vault make every integration auditable for Roskomnadzor.
4. **Financial storyline is wired.** Cost Anomaly Radar, Billing Intelligence Copilot, Partner Revenue Cockpit connect DR2 roadmap items to DR3 ROI so stakeholders see how the stack pays for itself.

### Target Architecture
| Layer | Purpose | Components | Status |
| --- | --- | --- | --- |
| **Orchestrator Core** | Run agents / workflows via MCP with approvals | MCP servers, Dagger pipelines, event bus | MVP active in our internal processes ({{doc:current_schema|Infra Pitch — working schema (05.11.2025)}}). |
| **Connector Registry** | Standardized access to monitoring, billing, marketplace, external LLMs | Registry metadata, secret vault, health checks | Live but needs Timeweb / Selectel adapters ({{doc:discovery_catalog_draft|Discovery Catalog — RU draft}}). |
| **Eval & Guardrail Layer** | Automated reasoning, 152-FZ rules | Automated reasoning harness, policy engine, trace store | Foundation ready; requires RU-specific policy tuning ({{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}). |
| **Knowledge & Memory** | Vector stores for runbooks/compliance/blueprints | Milvus / Weaviate, RAG pipelines, doc normalizer | Pilots exist; adapt formats to client data ({{doc:roadmap_draft|Flagship Roadmap Draft}}). |
| **Experience Layer** | Console Copilot, Trust Center, Launchpad, FinOps Copilot | Web + mobile, voice companion, dashboards | Designed in roadmap; needs demo prioritization ({{doc:roadmap_draft|Flagship Roadmap Draft}}, {{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}}). |

Architecture follows progressive automation: **read → recommend → execute**. Phases Ignite → Foundation → Pilot Scale → Expansion already mapped in {{doc:roadmap_draft|Flagship Roadmap Draft}} and reinforced by MCP Pipeline Studio (#25 in {{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}}).

### Compact Teams & Operating Rhythm
- **Forethought** (3 engineers, 30M+ SupportGPT interactions) proves small squads can sustain enterprise workloads via automation.
- **Shisa.ai** (3-person nano team, 405B-parameter Japanese LLM, 1M downloads in a month) shows even heavy voice/custom agents can launch with limited staff.
- **Soile AI** and regional cases support the “duo + expandable pod” model ({{doc:staffing_model_draft|Staffing & Operating Model — draft}}).

Our operating rhythm (weekly streams for Console Copilot / Marketplace / Support, monthly KPI demos) matches this scale and blends product cadence with engineering rigor.

### Market & Investment Drivers
- **Selectel:** +46% revenue (₽8.9B H1 2025), ₽3.7B capex, ₽10B AI investment plan, ₽355M marketing ({{doc:akm_selectel_ifrs_summary|Selectel — IFRS / RAS snapshot}}, {{doc:tadviser_selectel_highlights|Selectel highlights (TAdviser)}}).
- **State programs:** Union programs, BRICS infra funds, and sovereign AI initiatives demand localized stacks ({{doc:macro_landscape|Macro Landscape – AI Infrastructure & Agent Platforms (Nov 2025)}}).
- **Global capex:** Meta’s $70–72B AI spend, AWS guardrails, Anthropic MCP adoption show the stack sits in a hot market with big-ticket validation.

## Risks & Constraints
- **Data/API access.** Console Copilot needs telemetry, billing, and logs; access must be contractual ({{doc:roadmap_draft|Flagship Roadmap Draft}} dependencies).
- **Regulatory drift.** 152-FZ interpretations may change; policy engine + fallback flows must be updated continuously ({{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}).
- **External LLM limits.** OpenAI / Anthropic availability in RU is uncertain; need local alternatives (Shisa.ai, domestic LLMs) and hot-swappable connectors.
- **Duo capacity.** The backlog is strictly limited, with fractional experts slated for spikes ({{doc:staffing_model_draft|Staffing & Operating Model — draft}}).
- **Infra safety.** Automated runbooks require staged rollout + kill switches; change management discipline is mandatory.

## Final Recommendations for the Client (Vekus)
1. **Lock the architecture narrative into Vekus’ executive deck.** Present the “orchestrator + Connector Registry + eval/guardrail” stack as the standard that meets global benchmarks and Russian regulation.
2. **Schedule a Console Copilot + Trust Center demo.** Showcase read-only flows with a compliance scorecard and Discovery Catalog link ({{doc:roadmap_draft|Flagship Roadmap Draft}} phases 0–1).
3. **Deploy Connector Registry 1.0 inside the client perimeter.** Attach monitoring, billing, and marketplace APIs plus health checks and versioning so the Registry becomes the integration backbone.
4. **Embed 152-FZ guardrails in the production pipeline.** Blend AWS Automated Reasoning practices with the local checklist and cross-border journal ({{doc:dr2_5_compliance_checklist|DR2.5 — Cross-Border Checklist}}) so every integration is auditable.
5. **Broadcast the compact-team showcase.** Package Forethought, Shisa.ai, and Soile AI into a “team → scale → outcome” grid to neutralize capacity concerns and prove the small-team delivery model.
6. **Align follow-on research with this architecture.** Ensure DR2, DR3, and new documents reference the approved stack so Vekus sees one cohesive investment storyline ({{doc:overall_plan|Infra Pitch Package — plan}}).

## Sources
- {{doc:dr1_architecture_validation|DR1 — Proof Points for Multi-Orchestrator Engineering Stack}} — short digest + source index.
- {{doc:macro_landscape|Macro Landscape – AI Infrastructure & Agent Platforms (Nov 2025)}} — global & RU market signals.
- {{doc:roadmap_draft|Flagship Roadmap Draft}}, {{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}} — delivery phases & module list.
- {{doc:akm_selectel_ifrs_summary|Selectel — IFRS / RAS snapshot}}, {{doc:tadviser_selectel_highlights|Selectel highlights (TAdviser)}} — Selectel financials & AI investments.
- {{doc:staffing_model_draft|Staffing & Operating Model — draft}}, {{doc:current_schema|Infra Pitch — working schema (05.11.2025)}} — operating cadence + stack.
- {{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}, {{doc:dr2_5_compliance_checklist|DR2.5 — Cross-Border Checklist}} — regulatory requirements & guardrails.
- Public sources (TechCrunch AgentKit, InfoQ Azure MCP, InfoWorld/The Verge GitHub Agent HQ, AWS Automated Reasoning, CNBC/Meta capex) captured inside {{doc:dr1_architecture_validation|DR1 — Proof Points for Multi-Orchestrator Engineering Stack}}.
