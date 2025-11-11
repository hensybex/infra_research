# Russia’s Data Localization Regime (Federal Law 152‑FZ)

> **Scrape context:** Wikipedia + regulatory summaries on RU data localization to ground compliance guardrails.

## Core Requirement
- Operators processing personal data of Russian citizens must record, systematize, and store that data on equipment physically located inside Russia (Art.18(5)).

## Cross-Border Transfers
- Allowed only after notifying Roskomnadzor and confirming the destination country provides “adequate protection” (Art.12). The regulator can suspend transfers at any time.

## Anonymization Loophole
- Properly anonymized datasets (where individuals cannot be re-identified without extra info) fall outside the PD scope, enabling hybrid inference pipelines if tokenization is robust.

## Penalties & Enforcement
- Fines reach up to 18 M₽ per incident today, with proposals for turnover-based penalties (1–3% of revenue) for repeat offenders.
- Roskomnadzor can also block services or demand fail-safe relocation back to RU soil.

## Guidance for Infra Marketplace
- Encode localization checks directly into partner onboarding and automate event logs for every cross-border call.
- Maintain on-prem/edge replicas so services survive if regulators halt foreign transfers.
- Pair this note with `eng/notes/DR2_5_compliance_checklist.md` when drafting Compliance Guardrail Advisor stories.

## Sources
- Federal Law 152‑FZ coverage on Wikipedia / Roskomnadzor briefs (accessed Nov 2025).
