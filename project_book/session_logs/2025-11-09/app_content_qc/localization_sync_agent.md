# Localization Sync Agent Brief

## Mission
Guarantee that every document surfaced in the Infra Research App appears in the correct language bucket (titles, tags, summaries, chips) for both RU and EN locales.

## Scope
1. **Reports** — Files under `assets/{eng|rus}/reports/*.md` (summary + full variants per DR track).
2. **Notes** — Files under `assets/{eng|rus}/notes/*.md` plus any CSV helpers referenced in Markdown (e.g., `DR3_pricing_table.csv`).
3. **Registry Metadata** — `lib/data/services/document_registry.dart` seeds that define localized titles and references.
4. **Runtime View** — `DocumentRepository.languageCode` controls which documents land on Home cards; ensure filtering honors the active locale.

## Required Checks
1. **Asset Pairing**
   - For each slug in `_documentSeeds`, confirm both `engPath` and `ruPath` exist on disk.
   - Verify titles (`engTitle`/`ruTitle`) match the language of the underlying Markdown (no RU text in `engTitle`).
2. **Content Language**
   - Spot-check each English Markdown file to ensure headings + paragraphs are in English. If a Russian translation sneaks into the EN asset, flag it.
   - Same for RU files: no leftover English headings unless explicitly quoted.
3. **Home Screen Feed**
   - Inspect `lib/features/home/home_screen.dart`: the card list uses `repository.reports.take(4)`. Confirm whether `repository.reports` is already language-filtered; if not, document the required filter logic.
4. **Tags & Metadata**
   - Chips on `ReportCard` pull `document.tags` and translate via `AppLocalizations`. Ensure `document.languageCode` matches the current locale before rendering, otherwise duplicate cards appear.
5. **Hive / Cache (if applicable)**
   - If Hive boxes cache document metadata, confirm they store per-locale entries (no cross-language bleed after switching languages).

## Deliverables
- A checklist (per slug) noting any missing/incorrect localization artifacts.
- Suggested code or data fixes (e.g., filter `repository.reports` by `repository.languageCode`).
- Confirmation once English mode renders only English titles/tags and vice versa.
