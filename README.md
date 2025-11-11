# Infra Research App

Offline Flutter viewer for the DR1–DR3 research pack. The app reads Markdown reports/notes from `assets/{eng|rus}` at runtime (RU by default, EN on demand), builds navigation, and exposes actions for sharing, CSV export, and placeholder downloads.

## Features
- Bottom navigation covering Home, Library, Sources, Timeline, and Profile screens plus a global RU/EN toggle in the app bar.
- Dynamic Markdown loading from `assets/{eng|rus}/reports` with automatic Table of Contents, sticky detail header, and inline `eng/notes...` / `rus/notes...` preview support.
- Search + tag filters (Architecture, Roadmap, Compliance, Value) with an in-memory cache for repeated queries.
- Sources Hub that consolidates every `## Источники` block with type filters (internal / external / pending) and CSV export via `share_plus`, while report detail screens expose the same sources as tappable rows (notes → preview sheet, reports → in-app navigation, URLs → external browser).
- Timeline placeholder cards and Profile actions (email/Telegram + Request Update CTA).
- Full localization scaffold (RU default, EN optional) wired through `AppLocalizations`.

## Getting Started
1. Install Flutter 3.24+ (Dart 3.9) and run `flutter doctor`.
2. Fetch packages and localization code:
   ```bash
   flutter pub get
   flutter gen-l10n
   ```
3. Launch the app on any supported target:
   ```bash
   flutter run
   ```

## Working With Content
- Reports live under `assets/eng/reports/` and `assets/rus/reports/`. Drop a Markdown file into the appropriate folder—the loader discovers it automatically via `AssetManifest.json`.
- Notes for inline references belong in `assets/eng/notes/` and `assets/rus/notes/`. Links such as `eng/notes/example_note.md` or `rus/notes/example_note.ru.md` open a preview sheet if the asset exists; missing notes (e.g., `eng/notes/DR3_value_model_results.md`) still trigger the “Source pending” dialog.
- To keep localization strings up to date, edit the ARB files in `lib/l10n/` and rerun `flutter gen-l10n`.

## Helpful Commands
- Analyze & format:
  ```bash
  flutter analyze
  dart format .
  ```
- Run tests (none yet, but the target command is prepared):
  ```bash
  flutter test
  ```

## Adding New Reports
1. Copy the Markdown file into `assets/rus/reports/` or `assets/eng/reports/` (language determines where it appears by default).
2. Reference supporting notes under `assets/{rus|eng}/notes/` and ensure Markdown links use the correct prefix + extension (e.g., `rus/notes/macro_landscape.ru.md`).
3. Update KPIs or metadata in `lib/features/home/home_screen.dart` if new hero tiles are required.
4. Rebuild the app; the new file will appear automatically in the Library and Home highlights for the matching language.

## Known Placeholders
- `PDF` / `DOCX` / ZIP download buttons surface “Available soon” dialogs until real files are provided.
- Timeline data currently mirrors a static shortlist until `research_log.md` becomes available.

## Content Backlog
- Pending sources: `eng/notes/DR3_value_model_results.md` и `eng/notes/DR3_value_pricing.md` ещё не добавлены, поэтому соответствующие ссылки показывают «Источник появится после обновления».
