# Infra App — Working Schema (2025-11-09)

## Purpose
Capture the current surface-level issues BOSS flagged while reviewing the running Flutter build so we can keep scope aligned before touching code or Markdown content.

## Confirmed Context
- App reads Markdown via `DocumentRepository` and exposes reports in Home + Library. Reports currently enumerate from `assets/{eng|rus}/reports` and their note references resolve through `DocumentRegistry`.
- Each deep research track has two Markdown assets (summary + full) per language → 8 report cards per locale, which matches the current Library grid.
- Notes exist in both EN/RU under `assets/{eng|rus}/notes`; some contain raw scrape fragments that still leak into the UI.

## UX / UI Issues (to scope fixes)
1. **ReportCard footer (“Updated —”)** — Chips already show code+language, but an extra `updatedLabel('—')` renders a meaningless “Updated —” row on every card. Requirement: remove or replace with actual timestamp; default filler must disappear.
2. **Mixed-language tags & titles (Home screen)** — The Home hero list pulls `repository.reports.take(4)` without filtering by active language (needs verification in code). Result: English UI can still display RU titles/tags (and vice versa). Need to enforce language-aware slicing or add locale filters once the repository behaviour is confirmed.
3. **Table-of-Contents panel not sticky** — `_TocPanel` sits above the Markdown content but scrolls away once the user scrolls into the report body. Requirement: keep ToC visible (e.g., nested `SliverPersistentHeader` or side rail that stays pinned in wide layout and collapsible drawer on narrow screens).
4. **Keeper-link newline artifact** — Inline `{{doc:...}}` references render with a leading `\n` before the link text, producing awkward gaps in paragraphs. Investigate Markdown preprocessing (likely in `RegistryMarkdown` or the report parser) and strip stray newline characters before rendering.

## Content / Asset Issues
1. **Dirty supporting notes** — Several note files (e.g., `assets/eng/notes/openai_agent_cubed_tab_crunch.md`) mix curated insights with scrape dumps, placeholder metadata (“title / source published / ...”), and other leftover fragments. Need a dedicated clean-up pass guided by `scrapping-results-clearing.md` to polish the entire document, not just remove scrape blocks.
2. **Localization audit** — Ensure every report/note has consistent naming/metadata per language so the English locale never surfaces RU labels. Requires cross-checking `DocumentRegistry` seeds vs. actual assets and ensuring `repository.languageCode` influences Home selections.

## Decisions Locked with BOSS
- **Home “Updated —” row** — remove the row outright.
- **ToC (Table of Contents) behaviour** — the contents widget must stay visible while the user scrolls; pin it in place so navigation is always in reach (no extra responsive modes needed).
- **Note clean-up scope & scrape-note structure** — treat notes as generally “dirty” (scrape data, placeholders, stray thoughts) and, for scrape-sourced notes, open with a short explanation (“Scrape from X, needed for Y”) before the cleaned full scrape data (no junk like random social/media widgets). One combined clean-up task covers both the scope and the structure expectations.
- **Localization audit** — proceed after documentation review to guarantee EN mode surfaces only EN assets/titles/tags; this stays on the roadmap alongside the clean-up session.
