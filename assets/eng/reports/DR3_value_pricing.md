# Research Paper 4 Value, Pricing & ROI Model

## 1. Executive Summary
- Recommend a **36M₽ annual retainer** (≈$0.44M) for the engineer + product duo, staged in four 9M₽ milestone payments, plus outcome-aligned success fees that add ~8.6M₽ in the expected case.[art:20251105T151851Z-note-pricing-strategy]
- Expected roadmap impact totals **192.6M₽ (~$2.4M) in quantifiable value** across MTTR reduction, marketplace revenue, partner acceleration, compliance risk avoidance, and automation offsets—an estimated 17.6× return on the retainer.[art:20251105T151642Z-note-value-model-results]
- Conservative delivery (20% MTTR improvement, 2% ARR marketplace lift) still yields 72.6M₽ value (6.6× ROI), while aggressive uptake could exceed 329M₽ (30× ROI) with proportionally larger success fees.[art:20251105T151642Z-note-value-model-results]
- The retainer undercuts global boutique AI consulting benchmarks ($200–$350/hr) by ~30% and competes favorably with internal hiring costs once time-to-value and automation IP are included.[art:20251105T150845Z-raw-uptech-ai-cost][art:20251105T150730Z-raw-creolestudios-ai-agent-costs][art:20251105T150930Z-raw-profguide-ml-salaries][art:20251105T151005Z-raw-uchisonline-product-manager-salary]

## 2. Market Benchmarks
- **Global AI consulting & agent builds:** Creole Studios quotes $100–$500/hr and $10k–$250k+ per agent tier; Uptech observes $200–$350/hr consulting, $10k–$200k+ builds, and $5k–$25k discovery engagements.[art:20251105T150730Z-raw-creolestudios-ai-agent-costs][art:20251105T150845Z-raw-uptech-ai-cost][art:20251105T150510Z-raw-coherent-ai-costs]
- **Russia/CIS talent costs:** Senior ML engineers command up to 400k₽/month; lead product managers reach 250–500k₽/month gross, before ~30% employer taxes.[art:20251105T150930Z-raw-profguide-ml-salaries][art:20251105T151005Z-raw-uchisonline-product-manager-salary]
- **Infra peers:** Selectel reported 13.05B₽ revenue in 2024 (+28% YoY), with 8.9B₽ H1 2025 IFRS revenue; a 5% marketplace contribution would equate to ~450–650M₽ for peers at similar scale.[art:20251105T151420Z-raw-selectel-financials]
- **Compliance stakes:** Data localization breaches now trigger 3–15M₽ fines for 1k–100k records, 10–20M₽ for sensitive/biometric data, and 1–3% of turnover (min 20M₽) for repeat violations—underscoring the value of automated guardrails.[art:20251105T151305Z-raw-personal-data-fines]

## 3. Roadmap Impact Model (Scenarios)
- **Assumptions:** Baseline of 12 priority incidents/year with 120-minute MTTR; 6B₽ infra ARR; 10 partners/year worth 8M₽ net each; compliance violation probability cut from 15% to 5%; automation offsets 0.4 FTE. Downtime cost benchmark uses $1,670/minute (~$100k/hour).[art:20251105T151521Z-note-value-model-inputs][art:20251105T151205Z-raw-middleware-mttr-cost]
- **Scenario outputs:**
  - Conservative: 72.6M₽ value (26M₽ downtime, 42M₽ marketplace, 2.4M₽ onboarding, 0.7M₽ compliance, 1.5M₽ automation).[art:20251105T151642Z-note-value-model-results]
  - Expected: 192.6M₽ value (78.1M₽ downtime, 105M₽ marketplace, 5.9M₽ onboarding, 1.2M₽ compliance, 2.4M₽ automation).[art:20251105T151642Z-note-value-model-results]
  - Aggressive: 329.7M₽ value (146.4M₽ downtime, 168M₽ marketplace, 9.7M₽ onboarding, 2.0M₽ compliance, 3.6M₽ automation).[art:20251105T151642Z-note-value-model-results]
- **Sensitivity:** Pricing table (see `eng/notes/DR3_pricing_table.csv`) shows base 36M₽ retainer with success fees rising from 0 in conservative to 20.8M₽ if aggressive metrics are met.[art:20251105T152101Z-note-pricing-table]

## 4. Pricing & Contract Structure
- **Base retainer:** 36M₽/year in four 9M₽ tranches aligned to roadmap phases (Ignite, Foundation, Expansion, Transfer), keeping client cash flow linear while covering duo capacity.[art:20251105T151851Z-note-pricing-strategy]
- **Success fees:**
  - 8% share of downtime savings beyond 20% MTTR reduction baseline (≈3.1M₽ at expected performance).
  - 10% share of marketplace margin above 60M₽ (≈4.5M₽ expected).
  - 0.5M₽ per partner above 10/year (capped at +2M₽) to reward sustained pipeline velocity.
  - 1M₽ compliance bonus for zero reportable incidents with Trust Center audit readiness ≤5 days.
  - Expected success fees total ~8.6M₽; aggressive case up to ~20.8M₽.[art:20251105T151851Z-note-pricing-strategy]
- **Negotiation levers:** Highlight >70% value retention for client, optional conversion of success fees to credits/equity, and ability to benchmark against global hourly equivalents ($0.7M–$1.5M/year) to show savings.[art:20251105T151851Z-note-pricing-strategy][art:20251105T150845Z-raw-uptech-ai-cost]

## 5. Alternative Comparison
| Option | Annual Cost | Notes |
| --- | --- | --- |
| Proposed duo | 36M₽ base + success (~44.6M₽ expected) | Immediate start; automation IP included; aligns fees to outcomes.[art:20251105T151851Z-note-pricing-strategy]
| Internal hires | ≈10.9M₽ payroll + hiring lag | Requires 4–6 months recruitment; still needs automation tooling budget.[art:20251105T150930Z-raw-profguide-ml-salaries][art:20251105T151005Z-raw-uchisonline-product-manager-salary][art:20251105T151923Z-note-alternatives]
| Global boutique | $200–$350/hr (~150–260M₽/year for 2 FTE) | Higher cost; time-and-materials incentives misaligned; weaker RU compliance focus.[art:20251105T150845Z-raw-uptech-ai-cost][art:20251105T150730Z-raw-creolestudios-ai-agent-costs][art:20251105T151923Z-note-alternatives]
| Do nothing | 0 spend | Forfeits 72–193M₽ upside and increases risk of 10–20M₽ compliance fines.[art:20251105T151642Z-note-value-model-results][art:20251105T151305Z-raw-personal-data-fines][art:20251105T151923Z-note-alternatives]

## 6. Risks & Assumptions
- Validate incident volume, MTTR baseline, ARR size, and partner economics during discovery; pricing assumes 6B₽ ARR and 10 partners/year.[art:20251105T151521Z-note-value-model-inputs][art:20251105T151817Z-note-risk-assumptions]
- Success depends on timely telemetry/legal access, change-management for automation adoption, and healthy partner pipeline; embed governance cadence and KPI baselines in SOW.[art:20251105T151817Z-note-risk-assumptions]
- Monitor regulatory shifts and FX volatility; consider FX collars if retainer billed in USD or hybrid currency.[art:20251105T151817Z-note-risk-assumptions]

## Appendices & Artifacts
- Scenario tables & raw calculator: {{doc:dr3_value_model_results|DR3 Value Model Scenario Outputs}} (JSON + markdown).[art:20251105T151642Z-note-value-model-results]
- Pricing table (CSV): `eng/notes/DR3_pricing_table.csv`.[art:20251105T152101Z-note-pricing-table]
- Source bundle saved under `sources/DR3/` (Creole, Uptech, Profguide, Uchis-Online, Middleware, mc-groupp, AKM).[art:20251105T150730Z-raw-creolestudios-ai-agent-costs][art:20251105T150845Z-raw-uptech-ai-cost][art:20251105T150930Z-raw-profguide-ml-salaries][art:20251105T151005Z-raw-uchisonline-product-manager-salary][art:20251105T151205Z-raw-middleware-mttr-cost][art:20251105T151305Z-raw-personal-data-fines][art:20251105T151420Z-raw-selectel-financials]
