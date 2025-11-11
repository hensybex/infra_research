# Flagship Roadmap Draft

## Vision Anchors
- **Console Copilot / Operations Assistant**: conversational control plane for infra operations, informed by multi-agent orchestration trends (eng/notes/theverge_github_agent_hq_summary.md).
- **AI Marketplace / Partner Catalog**: curated sovereign marketplace leveraging co-innovation models (artifacts/scrape/20251105T134242Z_aws_partner_agent_factory.md; eng/notes/tadviser_selectel_highlights.md).
- **Support Modules**: compliance guardrails, onboarding concierge, billing intelligence derived from discovery catalog items.

## Phase Plan (6–12 Months)

### Phase 0: Ignite (Weeks 0-4)
- **Outcomes**: Align stakeholders, baseline observability + billing data pipelines, define governance for agents.
- **Key Actions**:
  - Launch Console Copilot slice with read-only observability summaries (Quick win).
  - Stand up FinOps data mart for billing anomaly radar (pre-req for marketplace KPIs).
  - Draft marketplace policy framework referencing localization obligations (eng/notes/wiki_data_localization_russia.md).
- **Dependencies**: Access to monitoring streams, billing exports, legal counsel.
- **Metrics**: Copilot daily active operators ≥5; baseline MTTR recorded; billing data freshness <6h.

### Phase 1: Foundation (Months 1-3)
- **Console Copilot**:
  - Add runbook execution via MCP runbooks (requires Phase 0 telemetry).
  - Deliver incident war room summarizer (eng/notes/theverge_github_agent_hq_summary.md).
- **Marketplace Core**:
  - Build Marketplace Launchpad MVP covering intake + compliance checklist.
  - Publish initial AI Solution Blueprint Library for 3 verticals.
- **Support Modules**:
  - Ship Compliance Guardrail Advisor alpha.
  - Deploy Cost Anomaly Radar dashboards for internal FinOps.
- **Quick Wins**: Automated incident status posts reduce manual paging; partner intake time cut by 30%.
- **Metrics**: 70% of priority incidents summarized automatically; 3 partner offers onboarded; compliance checklist coverage 80% of required artifacts.

### Phase 2: Pilot Scale (Months 3-6)
- **Console Copilot**:
  - Integrate change automation (rollback, feature flags) with approval workflows.
  - Introduce Voice Ops Companion beta for field engineers (eng/notes/azure_ai_foundry_future_agents_summary.md).
- **Marketplace**:
  - Launch Partner Sandbox Orchestrator and Marketplace Quality Scoring.
  - Open Marketplace Trust Center for transparency.
- **Support Modules**:
  - Release Billing Intelligence Copilot with forecasting.
  - Start Resident Program Tracker for partner enablement.
- **Dependencies**: Security review for automation, sandbox infrastructure, marketing alignment.
- **Metrics**: 50% of maintenance tasks automated; partner NPS ≥8; marketplace GMV target defined; billing forecast accuracy ±5%.

### Phase 3: Expansion (Months 6-12)
- **Console Copilot**:
  - Embed Security Playbook Agent with DDoS automation (eng/notes/tadviser_selectel_highlights.md).
  - Launch Observability Storyboard with causal graph insights.
- **Marketplace**:
  - Release Industry Catalyst Bundles and Edge Placement Planner insights for partners.
  - Achieve 20+ marketplace offers with Trust Center scorecards.
- **Support Modules**:
  - Expand Compliance Evidence Vault for audit-ready exports.
  - Deploy Learning Loop Analytics to tune agent experiences.
- **Metrics**: MTTR reduced by 40%; marketplace revenue contribution ≥5% of infra ARR; audit readiness in <5 days; automation coverage >60% of repetitive tasks.

## Dependencies & Sequencing Highlights
- **Data Pipelines First**: Billing + telemetry feeds unlock most intelligent agents; invest early (Phase 0/1).
- **Compliance Threading**: Governance models must be encoded before external marketplace scale; guardrails precede partner expansion.
- **Automation Safety**: Incrementally gate automation (read-only → suggest → execute with approval) in Console Copilot to manage risk.

## Quick Win Opportunities
- Read-only Console Copilot status digest within 4 weeks builds trust.
- Blueprint Library + Discovery Catalog repackaged as downloadable playbooks for early partner marketing.
- Internal FinOps dashboards reduce manual spreadsheet work immediately, proving value to finance.

## Metrics Dashboard (sample)
- **Ops**: MTTR, % incidents summarized, automation success rate.
- **Marketplace**: Count of published offers, partner onboarding cycle time, Trust Center completion rate.
- **Financial**: Marketplace GMV, cost savings from anomaly detection, capex utilization vs. plan (eng/notes/akm_selectel_ifrs_summary.md).
- **Compliance**: Time to produce localization audit evidence, % workloads with guardrails enabled.

## Risk & Mitigation Notes
- **Automation Risk**: Over-aggressive runbook execution can cause outages → adopt progressive enablement with human-in-the-loop approvals.
- **Compliance Exposure**: Marketplace partners may fail localization → embed automated checks and manual review gates (eng/notes/wiki_data_localization_russia.md).
- **Capacity Constraints**: Core team capacity is limited → prioritize reusable automation (Pipeline Studio, Learning Loop) to avoid burnout.
- **Partner Adoption**: Sovereign vendors may hesitate → leverage Trust Center transparency and co-marketing referencing RU investment momentum (eng/notes/tadviser_selectel_highlights.md).
