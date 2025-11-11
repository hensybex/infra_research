# Final Implementation Plan

## 1. Profile Screen Modernization
- [x] Remove the “Request update” card and related l10n strings.
- [x] Refresh contact card copy (Tim CEO/CTO positioning, Rita Product Partner) with correct UTC offsets and capability tags.
- [x] Update contact action buttons to use Tim’s email (`kamenetskiyto@gmail.com`) and Telegram (`@hensybex2`), keeping SLA messaging.

## 2. Rename Research Deliverables
- [x] Replace “DR1/DR2/DR3/DR2.5” labels across navigation, titles, and metadata with “Research Paper 1–4” plus concise subtitles.
- [x] Sweep Markdown reports/notes for legacy “DR*” references and align headers/links with the new naming.

## 3. Pitch Pack Asset Overhaul
- [x] Design a new folder layout for offline assets (e.g., `/research_papers/paper*/…`, `/letters/…`).
- [x] Author a reproducible packaging script (e.g., `tool/build_research_pack.dart`) that outputs `research_pack.zip`.
- [x] Update the profile pitch card UI copy and download/share handlers to point at the new ZIP.

## 4. Embedded Deck Integration
- [x] Extract the presentation Flutter app into a reusable local package (code + assets) and add it to `infra/pubspec.yaml`.
- [x] Replace the Markdown-based `PresentationScreen` with the embedded deck widget, keeping an easy exit affordance.
- [x] Remove the obsolete markdown asset or gate it behind a fallback flag.

## 5. Recommendation Letters Module
- [x] Introduce a `RecommendationLetter` model + stub data for the two live letters (and placeholder for the third).
- [x] Render a new card on the profile screen that lists each letter with summary text and Doc links (opening via `url_launcher`).
- [x] Ensure letters metadata is bundled inside the new research pack for offline reference.
