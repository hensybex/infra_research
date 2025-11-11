# UI Fix Session — 2025-11-09

- Dropped the placeholder `updatedLabel('—')` row from `ReportCard` so the Home feed no longer shows meaningless “Updated —” footers.
- Filtered the Home hero list by `repository.languageCode` before taking the top four reports, ensuring English viewers only see EN documents (and RU viewers only see RU).
- Reworked `ReportDetailScreen` layout so, on wide viewports, the Table of Contents sits in a pinned side rail outside the main scroll while narrow layouts keep the inline version; added independent scrolling for the panel to keep the entire nav accessible.
- Normalized `RegistryMarkdown` payloads by collapsing single newlines that directly precede `{{doc:...}}` references, eliminating the stray gap before keeper links.
- Replaced the wide-layout implementation with a stack-based rail that carves out horizontal space for the ToC and anchors it via `Positioned`, making the navigation card truly sticky even while the document body scrolls independently.
- Added an explicit guard around `ReportCard` tags so the widget now only renders the metadata chips (and nothing afterward) when tags exist, ensuring the lingering “Updated —” row can’t reappear via stale widget trees.
