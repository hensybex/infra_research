import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ASSETS = ROOT / 'assets'
REPORT_DIRS = [ASSETS / 'eng' / 'reports', ASSETS / 'rus' / 'reports']
LINK_PATTERN = re.compile(r'\[(?P<label>[^\]]+)\]\((?P<path>[^\)]+)\)')
PATH_PATTERN = re.compile(r'(?P<path>[A-Za-z0-9_./-]+\.md)(?::(?P<line>\d+))?')
LINE_SUFFIX_PATTERN = re.compile(r'(\{\{doc:[^}]+}})\s*\((?:стр\.|p\.)\s*\d+\)', re.IGNORECASE)
REMOVE = object()

def build_title_cache():
    cache: dict[str, str] = {}
    for path in ASSETS.rglob('*.md'):
        rel = path.relative_to(ASSETS).as_posix()
        cache[rel.lower()] = extract_title(path)
    return cache

def extract_title(path: Path) -> str:
    try:
        for line in path.read_text(encoding='utf-8').splitlines():
            stripped = line.strip()
            if stripped.startswith('# '):
                return stripped[2:].strip()
    except Exception:
        pass
    return path.stem

def slug_from_reference(reference: str) -> str:
    filename = reference.split('/')[-1]
    filename = re.sub(r'\.ru(?=\.md$)', '', filename, flags=re.IGNORECASE)
    filename = filename.replace('.md', '')
    return filename.replace('.', '_').lower()

def resolve_reference(raw: str, preferred_lang: str):
    cleaned = raw.strip()
    lower = cleaned.lower()
    if lower == '.ru.md':
        return REMOVE
    if cleaned.endswith('/.ru.md'):
        cleaned = cleaned[: -len('/.ru.md')]
    if cleaned.endswith('.ru.md') and not cleaned.startswith('rus/'):
        cleaned = f'rus/{cleaned}'
    candidates: list[str] = []
    lower = cleaned.lower()
    if lower.startswith(('eng/', 'rus/')):
        candidates.append(cleaned)
    elif lower.startswith('notes/'):
        suffix = cleaned.split('/', 1)[1]
        candidates.extend([
            f'{preferred_lang}/notes/{suffix}',
            f'eng/notes/{suffix}',
            f'rus/notes/{suffix}',
        ])
    elif lower.startswith('reports/'):
        suffix = cleaned.split('/', 1)[1]
        candidates.extend([
            f'{preferred_lang}/reports/{suffix}',
            f'eng/reports/{suffix}',
            f'rus/reports/{suffix}',
        ])
    elif lower.startswith('notes\\'):
        suffix = cleaned.split('\\', 1)[1]
        candidates.append(f'{preferred_lang}/notes/{suffix}')
    else:
        filename = cleaned.split('/')[-1]
        matches = list(ASSETS.rglob(filename))
        if matches:
            def score(path: Path):
                rel = path.relative_to(ASSETS).as_posix()
                if rel.startswith(f'{preferred_lang}/'):
                    return (0, rel)
                if rel.startswith('eng/') or rel.startswith('rus/'):
                    return (1, rel)
                return (2, rel)
            matches.sort(key=score)
            candidates.extend(
                p.relative_to(ASSETS).as_posix() for p in matches
            )
    for candidate in candidates:
        path = ASSETS / candidate
        if path.exists():
            return candidate
    return ''

def make_token(target: str, label: str) -> str:
    slug = slug_from_reference(target)
    if not slug:
        return label
    safe_label = label.strip()
    return f'{{{{doc:{slug}|{safe_label}}}}}'

def linkify(text: str, preferred_lang: str, titles: dict[str, str]) -> str:
    def replace_markdown(match: re.Match[str]) -> str:
        label = match.group('label')
        raw = match.group('path')
        target = resolve_reference(raw, preferred_lang)
        if target is REMOVE:
            return ''
        if not target:
            return label
        return make_token(target, label)

    def replace_bare(match: re.Match[str]) -> str:
        raw = match.group('path')
        target = resolve_reference(raw, preferred_lang)
        if target is REMOVE:
            return ''
        if not target:
            return match.group(0)
        label = titles.get(target.lower(), slug_from_reference(target))
        return make_token(target, label)

    updated = LINK_PATTERN.sub(replace_markdown, text)
    updated = PATH_PATTERN.sub(replace_bare, updated)
    updated = LINE_SUFFIX_PATTERN.sub(r'\1', updated)
    updated = updated.replace('`{{doc:', '{{doc:').replace('}}`', '}}')
    return updated

def main() -> None:
    titles = build_title_cache()
    for reports_root in REPORT_DIRS:
        for report in sorted(reports_root.glob('*.md')):
            preferred_lang = 'rus' if '/rus/' in report.as_posix() else 'eng'
            original = report.read_text(encoding='utf-8')
            updated = linkify(original, preferred_lang, titles)
            if updated != original:
                report.write_text(updated, encoding='utf-8')
                print(f'Updated {report}')

if __name__ == '__main__':
    main()
