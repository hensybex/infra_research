# Research Paper 2.5 — Cross-Border Marketplace Access (Full Report)

## Executive Summary
- Russian personal-data law 152-FZ allows cross-border inference only under strict rules: RU citizen data must be stored in-country (Art.18(5)), outbound transfer requires Roskomnadzor notification + “adequacy” assessment (Art.12), and anonymized data fall outside the regime (Art.3). Details documented in {{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}} and {{doc:dr2_5_compliance_checklist|DR2.5 — Cross-Border Checklist}}.
- Hybrid models are already mainstream: Yandex B2B shifts services to on-prem, Russia–Belarus–China–India programs build shared tech hubs, BRICS announces joint infra projects (sources A20251105-04/06/07/08/09).
- Enforcement is real: Roskomnadzor escalated audits, fines reach ₽18M for localization breaches and may jump to 1–3% of revenue for repeat cases ({{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}}). Marketplaces need fail-safe flows + cross-border event logs.
- Proposed three-tier access model: (1) fully resident offers inside RU, (2) hybrid offers with anonymization + notifications, (3) BRICS/CIS partners under joint governance + mandatory Evidence Vault. Each tier has its own checklist and SLA.
- Trust Center, Compliance Guardrail Advisor, and Sovereign Data Toolkit from DR2 provide automation hooks: classify data, vet contracts, trigger on-prem fallback, and assemble notification packets.

## Context & Goal
This report bridges DR2 (strategy) and DR3 (finance). The client needs a standalone brief for legal/compliance teams: what laws govern cross-border inference, which partners qualify, how the admission workflow looks, what to monitor, and how to embed controls in the stack. Sources: {{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}} (digest), {{doc:dr2_5_compliance_checklist|DR2.5 — Cross-Border Checklist}} (ops checklist), plus localization + union-program notes ({{doc:macro_landscape|Macro Landscape – AI Infrastructure & Agent Platforms (Nov 2025)}}, {{doc:mts_marketplace_news_summary|MTS marketplace launch brief}}).

## Key Findings
1. **Localization is baseline.** RU citizen data must be collected/stored in RU; even temporary buffers abroad without notification trigger violations.
2. **Anonymization unlocks options.** If the pipeline ensures irreversible anonymization (tokenization, k-anon, differential privacy), inference may run outside RU—but only with documented proof and Roskomnadzor notice.
3. **Notifications are mandatory.** Cross-border transfers require pre-notification, adequacy assessment (Art.12), and incident logging. Evidence Vault keeps stamped templates.
4. **Partner diligence matters.** BRICS/CIS partners should pass security, localization, and contractual reviews. Launchpad must embed those checks.

### Three-Tier Access Model
| Tier | Description | Controls |
| --- | --- | --- |
| **Tier 1 — Resident** | 100% RU infrastructure & data; only RU partners | Data residency attestation, on-prem inference, sovereign toolkit. |
| **Tier 2 — Hybrid** | RU storage + anonymized inference abroad | Tokenization, notification package, reversible kill-switch, Evidence Vault record. |
| **Tier 3 — BRICS/CIS** | Friendly jurisdictions + joint governance | Shared audit calendar, trust agreements, local agent of record, Roskomnadzor-ready reports. |

### Process Overview
1. **Intake via Launchpad**: partner submits legal entity, hosting map, data categories. Form fields map 1:1 to checklist items.
2. **Automated screening**: Compliance Guardrail Advisor evaluates 152-FZ articles, cross-border purpose, DPIA status.
3. **Manual review**: legal/compliance validate adequacy of jurisdiction, contract clauses, certifications.
4. **Technical gating**: Sovereign Data Toolkit enforces storage location, encryption, anonymization flows.
5. **Decision + logging**: Evidence Vault stores notification letters, audit logs, fallback instructions; Trust Center card updates within ≤5 days.

### Precedents & Market Signals
- **Yandex B2B** moved Yandex 360 & Yandex Cloud workloads to on-prem (A20251105-08) → demand for resident offers.
- **BRICS Industrial Forum 2025** discussed joint tech platforms (Port Santos $5B+) (A20251105-06).
- **Russia–India fund** & **Russia–Belarus union contour** show appetite for joint solutions that honor RU rules (A20251105-07/09).
- **Russia–China AI ethics council** focuses on standards that slot neatly into Trust Center (A20251105-04).

### Tooling & Automation
- **Compliance Guardrail Advisor** — policy engine that maps workloads to 152-FZ + flags remediation.
- **Sovereign Data Toolkit** — pipelines + contract templates for resident deployments.
- **AI Marketplace Trust Center** — public attestation catalog with ≤5 day update SLA.
- **Compliance Evidence Vault** — immutable store for logs, notifications, DPIAs.
- **Resident Program Tracker** — monitors partner status, audit cadence, localization commitments.

All tools live inside the MCP orchestrator, so checks launch from Launchpad/Console Copilot and results auto-fill Evidence Vault.

## Risks & Constraints
- **Regulatory volatility** — adequacy list can change overnight; need monitoring + instant disable switches.
- **Partner behavior** — partners might skip procedures; regular audits + contractual penalties required.
- **Anonymization limits** — some datasets lose value when anonymized; they must stay Tier 1.
- **Reputation** — any compliance incident erodes marketplace trust; Trust Center must stay current.
- **Team load** — compliance infra needs discipline; secure fractional counsel and maximize automation.

## Final Recommendations for Vekus
1. **Ratify the three-tier policy at Vekus’ board.** A formal mandate arms executive teams when talking to partners and regulators.
2. **Embed the 152-FZ checklist directly into Launchpad.** Every form field should map to a legal requirement to eliminate manual reviews.
3. **Stand up Evidence Vault + Trust Center before marketplace scale.** Without immutable logs and public attestations, audits will stall deals.
4. **Publish a BRICS playbook.** Document required paperwork, technical baselines, and permissible models for India, China, Belarus, etc.
5. **Run automated country-status monitoring.** Combine external feeds and internal signals to shut down disallowed routes within minutes.
6. **Hold monthly DR2/DR3 syncs.** Joint Ops + Legal + Finance checkpoints keep roadmap priorities and the financial model aligned with compliance realities.

## Sources
- {{doc:dr2_5_market_access|DR2.5 — Cross-Border Marketplace Access}} — law + precedent digest.
- {{doc:dr2_5_compliance_checklist|DR2.5 — Cross-Border Checklist}} — operational checklist for Art.3/12/18(5).
- {{doc:macro_landscape|Macro Landscape – AI Infrastructure & Agent Platforms (Nov 2025)}} — market context.
- {{doc:mts_marketplace_news_summary|MTS marketplace launch brief}} — local marketplace example.
- {{doc:dr2_solution_pathing|DR2 — Solution Pathing & Growth Portfolio}}, {{doc:discovery_catalog_table_referenced|Discovery Catalog Reference}} — tooling references.
- Source pack A20251105-01…09 (152-FZ, Roskomnadzor, RIA, RBC, MySeldon/Россия 24, Content-Review, BelTA).
