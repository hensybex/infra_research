import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infra/data/models/document_record.dart';

class DocumentRegistry {
  DocumentRegistry._(this._box) {
    _rebuildIndexes();
  }

  static const _boxName = 'document_registry';
  static const bool _resetOnLaunch = true;
  static DocumentRegistry? _instance;

  static DocumentRegistry get instance {
    final registry = _instance;
    if (registry == null) {
      throw StateError('DocumentRegistry is not initialized yet.');
    }
    return registry;
  }

  static Future<void> ensureInitialized() async {
    if (_instance != null) {
      return;
    }
    await Hive.initFlutter();
    if (_resetOnLaunch && await Hive.boxExists(_boxName)) {
      debugPrint('[DocumentRegistry] Reset flag on — deleting old box');
      await Hive.deleteBoxFromDisk(_boxName);
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(DocumentKindAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(DocumentRecordAdapter());
    }
    final box = await Hive.openBox<DocumentRecord>(_boxName);
    final registry = DocumentRegistry._(box);
    await registry._seedIfRequired();
    debugPrint(
      '[DocumentRegistry] Initialized with ${registry._box.length} records',
    );
    _instance = registry;
  }

  final Box<DocumentRecord> _box;
  final Map<String, DocumentRecord> _referenceIndex = {};
  final Map<String, List<DocumentRecord>> _slugIndex = {};

  Iterable<DocumentRecord> get records => _box.values;

  DocumentRecord? resolveBySlug(String slug, {String? preferredLanguage}) {
    final candidates = _slugIndex[_slugKey(slug)];
    if (candidates == null || candidates.isEmpty) {
      return null;
    }
    if (preferredLanguage != null) {
      final match = candidates.firstWhereOrNull(
        (record) => record.languageCode == preferredLanguage,
      );
      if (match != null) {
        return match;
      }
    }
    return candidates.first;
  }

  DocumentRecord? resolve(String reference, {String? preferredLanguage}) {
    final normalized = _normalizeReference(reference);
    final direct = _referenceIndex[normalized];
    if (direct != null) {
      return direct;
    }
    final slug = _slugFromReference(normalized);
    if (slug == null) return null;
    final kindHint = _kindFromReference(normalized);
    final candidates = _slugIndex[_slugKey(slug)];
    if (candidates == null || candidates.isEmpty) {
      return null;
    }
    final filtered = kindHint == null
        ? candidates
        : candidates.where((record) => record.kind == kindHint).toList();
    if (filtered.isEmpty) return null;
    if (preferredLanguage != null) {
      final match = filtered.firstWhereOrNull(
        (record) => record.languageCode == preferredLanguage,
      );
      if (match != null) {
        return match;
      }
    }
    return filtered.first;
  }

  String? resolveDisplayName(String? reference, {String? locale}) {
    if (reference == null) return null;
    final language = locale?.startsWith('ru') == true
        ? 'ru'
        : locale?.startsWith('en') == true
        ? 'en'
        : null;
    return resolve(reference, preferredLanguage: language)?.displayName;
  }

  Future<void> _seedIfRequired() async {
    final expectedEntries = _documentSeeds.length * 2;
    if (_box.length == expectedEntries) {
      debugPrint('[DocumentRegistry] Box already seeded ($expectedEntries)');
      _rebuildIndexes();
      return;
    }
    debugPrint(
      '[DocumentRegistry] Seeding box: existing=${_box.length}, expected=$expectedEntries',
    );
    await _box.clear();
    for (final seed in _documentSeeds) {
      for (final record in seed.toRecords()) {
        await _box.put(record.key, record);
      }
    }
    _rebuildIndexes();
  }

  void _rebuildIndexes() {
    _referenceIndex.clear();
    _slugIndex.clear();
    for (final record in _box.values) {
      final normalizedReference = _normalizeReference(record.reference);
      _referenceIndex[normalizedReference] = record;
      _slugIndex.putIfAbsent(_slugKey(record.slug), () => []).add(record);
    }
  }
}

String _normalizeReference(String reference) {
  final sanitized = reference
      .trim()
      .replaceAll('\\', '/')
      .replaceAll('/.ru.md', '.ru.md')
      .replaceAll('/.md', '.md')
      .replaceFirst(RegExp(r'^assets/'), '')
      .replaceFirst(RegExp(r'^\.?/'), '')
      .toLowerCase();
  return sanitized;
}

String? _slugFromReference(String? reference) {
  if (reference == null || reference.isEmpty) return null;
  final segments = reference.split('/');
  if (segments.isEmpty) return null;
  var filename = segments.last;
  if (filename.isEmpty) return null;
  filename = filename
      .replaceFirst(RegExp(r'\.ru(?=\.md$)'), '')
      .replaceAll('.md', '')
      .replaceAll('.', '_')
      .toLowerCase();
  return filename;
}

String _slugKey(String slug) => slug.toLowerCase();

DocumentKind? _kindFromReference(String reference) {
  if (reference.contains('/notes/') || reference.startsWith('notes/')) {
    return DocumentKind.note;
  }
  if (reference.contains('/reports/') || reference.startsWith('reports/')) {
    return DocumentKind.report;
  }
  return null;
}

class _DocumentSeed {
  const _DocumentSeed({
    required this.slug,
    required this.kind,
    required this.engPath,
    required this.ruPath,
    required this.engTitle,
    required this.ruTitle,
  });

  final String slug;
  final DocumentKind kind;
  final String engPath;
  final String ruPath;
  final String engTitle;
  final String ruTitle;

  Iterable<DocumentRecord> toRecords() sync* {
    yield _toRecord(languageCode: 'en', assetPath: engPath, title: engTitle);
    yield _toRecord(languageCode: 'ru', assetPath: ruPath, title: ruTitle);
  }

  DocumentRecord _toRecord({
    required String languageCode,
    required String assetPath,
    required String title,
  }) {
    final reference = assetPath.replaceFirst('assets/', '');
    final key = '${slug}_${languageCode}_${kind.name}';
    return DocumentRecord(
      key: key,
      slug: slug,
      languageCode: languageCode,
      kind: kind,
      assetPath: assetPath,
      reference: reference,
      displayName: title,
    );
  }
}

final List<_DocumentSeed> _documentSeeds = [
  _DocumentSeed(
    slug: 'dr1_architecture_validation',
    kind: DocumentKind.report,
    engPath: 'assets/eng/reports/DR1_architecture_validation.md',
    ruPath: 'assets/rus/reports/DR1_architecture_validation.ru.md',
    engTitle: 'Research Paper 1 · Architecture Validation',
    ruTitle: 'Исследование 1 · Архитектурная валидация',
  ),
  _DocumentSeed(
    slug: 'dr1_architecture_validation_full',
    kind: DocumentKind.report,
    engPath: 'assets/eng/reports/DR1_architecture_validation_full.md',
    ruPath: 'assets/rus/reports/DR1_architecture_validation_full.ru.md',
    engTitle: 'Research Paper 1 · Architecture Validation (Full)',
    ruTitle: 'Исследование 1 · Архитектура (полная версия)',
  ),
  _DocumentSeed(
    slug: 'dr2_5_market_access',
    kind: DocumentKind.report,
    engPath: 'assets/eng/reports/DR2_5_market_access.md',
    ruPath: 'assets/rus/reports/DR2_5_market_access.ru.md',
    engTitle: 'Research Paper 3 · Market Access',
    ruTitle: 'Исследование 3 · Доступ на рынок',
  ),
  _DocumentSeed(
    slug: 'dr2_5_market_access_full',
    kind: DocumentKind.report,
    engPath: 'assets/eng/reports/DR2_5_market_access_full.md',
    ruPath: 'assets/rus/reports/DR2_5_market_access_full.ru.md',
    engTitle: 'Research Paper 3 · Market Access (Full)',
    ruTitle: 'Исследование 3 · Доступ на рынок (полная версия)',
  ),
  _DocumentSeed(
    slug: 'dr2_solution_pathing',
    kind: DocumentKind.report,
    engPath: 'assets/eng/reports/DR2_solution_pathing.md',
    ruPath: 'assets/rus/reports/DR2_solution_pathing.ru.md',
    engTitle: 'Research Paper 2 · Solution Pathing',
    ruTitle: 'Исследование 2 · Solution Pathing',
  ),
  _DocumentSeed(
    slug: 'dr2_solution_pathing_full',
    kind: DocumentKind.report,
    engPath: 'assets/eng/reports/DR2_solution_pathing_full.md',
    ruPath: 'assets/rus/reports/DR2_solution_pathing_full.ru.md',
    engTitle: 'Research Paper 2 · Solution Pathing (Full)',
    ruTitle: 'Исследование 2 · Solution Pathing (полная версия)',
  ),
  _DocumentSeed(
    slug: 'dr3_value_pricing',
    kind: DocumentKind.report,
    engPath: 'assets/eng/reports/DR3_value_pricing.md',
    ruPath: 'assets/rus/reports/DR3_value_pricing.ru.md',
    engTitle: 'Research Paper 4 · Value & Pricing',
    ruTitle: 'Исследование 4 · Ценность и прайсинг',
  ),
  _DocumentSeed(
    slug: 'dr3_value_pricing_full',
    kind: DocumentKind.report,
    engPath: 'assets/eng/reports/DR3_value_pricing_full.md',
    ruPath: 'assets/rus/reports/DR3_value_pricing_full.ru.md',
    engTitle: 'Research Paper 4 · Value & Pricing (Full)',
    ruTitle: 'Исследование 4 · Ценность и прайсинг (полная версия)',
  ),
  _DocumentSeed(
    slug: 'dr2_5_compliance_checklist',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/DR2_5_compliance_checklist.md',
    ruPath: 'assets/rus/notes/DR2_5_compliance_checklist.ru.md',
    engTitle: 'Research Paper 3 · Compliance Checklist',
    ruTitle: 'Исследование 3 · чек-лист комплаенса',
  ),
  _DocumentSeed(
    slug: 'dr2_decision_log',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/DR2_decision_log.md',
    ruPath: 'assets/rus/notes/DR2_decision_log.ru.md',
    engTitle: 'Research Paper 2 · Decision Log',
    ruTitle: 'Исследование 2 · журнал решений',
  ),
  _DocumentSeed(
    slug: 'dr3_pricing_table',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/DR3_pricing_table.md',
    ruPath: 'assets/rus/notes/DR3_pricing_table.ru.md',
    engTitle: 'Research Paper 4 · Pricing Table',
    ruTitle: 'Исследование 4 · таблица прайсинга',
  ),
  _DocumentSeed(
    slug: 'dr3_value_model_results',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/DR3_value_model_results.md',
    ruPath: 'assets/rus/notes/DR3_value_model_results.ru.md',
    engTitle: 'Research Paper 4 · Value Model Results',
    ruTitle: 'Исследование 4 · результаты модели ценности',
  ),
  _DocumentSeed(
    slug: 'dr3_value_pricing',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/DR3_value_pricing.md',
    ruPath: 'assets/rus/notes/DR3_value_pricing.ru.md',
    engTitle: 'Research Paper 4 · Pricing Cheat Sheet',
    ruTitle: 'Исследование 4 · шпаргалка по прайсингу',
  ),
  _DocumentSeed(
    slug: 'akm_selectel_ifrs_summary',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/akm_selectel_ifrs_summary.md',
    ruPath: 'assets/rus/notes/akm_selectel_ifrs_summary.ru.md',
    engTitle: 'Selectel IFRS Summary (AKM)',
    ruTitle: 'Selectel IFRS — конспект (AKM)',
  ),
  _DocumentSeed(
    slug: 'azure_ai_foundry_future_agents_summary',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/azure_ai_foundry_future_agents_summary.md',
    ruPath: 'assets/rus/notes/azure_ai_foundry_future_agents_summary.ru.md',
    engTitle: 'Azure AI Foundry — Future of Agents',
    ruTitle: 'Azure AI Foundry — будущее агентов',
  ),
  _DocumentSeed(
    slug: 'brief_strategy',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/brief_strategy.md',
    ruPath: 'assets/rus/notes/brief_strategy.ru.md',
    engTitle: 'Strategy Brief',
    ruTitle: 'Стратегический бриф',
  ),
  _DocumentSeed(
    slug: 'current_schema',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/current_schema.md',
    ruPath: 'assets/rus/notes/current_schema.ru.md',
    engTitle: 'Current Architecture Schema',
    ruTitle: 'Текущая архитектура',
  ),
  _DocumentSeed(
    slug: 'discovery_catalog_draft',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/discovery_catalog_draft.md',
    ruPath: 'assets/rus/notes/discovery_catalog_draft.ru.md',
    engTitle: 'Discovery Catalog · Draft',
    ruTitle: 'Каталог Discovery · драфт',
  ),
  _DocumentSeed(
    slug: 'discovery_catalog_table_referenced',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/discovery_catalog_table_referenced.md',
    ruPath: 'assets/rus/notes/discovery_catalog_table_referenced.ru.md',
    engTitle: 'Discovery Catalog · Referenced Table',
    ruTitle: 'Каталог Discovery · таблица',
  ),
  _DocumentSeed(
    slug: 'macro_landscape',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/macro_landscape.md',
    ruPath: 'assets/rus/notes/macro_landscape.ru.md',
    engTitle: 'Macro Landscape Scan',
    ruTitle: 'Макро-обзор',
  ),
  _DocumentSeed(
    slug: 'mts_marketplace_news_summary',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/mts_marketplace_news_summary.md',
    ruPath: 'assets/rus/notes/mts_marketplace_news_summary.ru.md',
    engTitle: 'MTS Marketplace · News Summary',
    ruTitle: 'МТС Маркетплейс · дайджест',
  ),
  _DocumentSeed(
    slug: 'overall_plan',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/overall_plan.md',
    ruPath: 'assets/rus/notes/overall_plan.ru.md',
    engTitle: 'Overall Plan',
    ruTitle: 'Общий план',
  ),
  _DocumentSeed(
    slug: 'roadmap_draft',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/roadmap_draft.md',
    ruPath: 'assets/rus/notes/roadmap_draft.ru.md',
    engTitle: 'Roadmap Draft',
    ruTitle: 'Черновик дорожной карты',
  ),
  _DocumentSeed(
    slug: 'staffing_model_draft',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/staffing_model_draft.md',
    ruPath: 'assets/rus/notes/staffing_model_draft.ru.md',
    engTitle: 'Staffing Model Draft',
    ruTitle: 'Драфт модели команды',
  ),
  _DocumentSeed(
    slug: 'tadviser_selectel_highlights',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/tadviser_selectel_highlights.md',
    ruPath: 'assets/rus/notes/tadviser_selectel_highlights.ru.md',
    engTitle: 'TAdviser · Selectel Highlights',
    ruTitle: 'TAdviser · выдержки о Selectel',
  ),
  _DocumentSeed(
    slug: 'theverge_github_agent_hq_summary',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/theverge_github_agent_hq_summary.md',
    ruPath: 'assets/rus/notes/theverge_github_agent_hq_summary.ru.md',
    engTitle: 'GitHub Agent HQ · The Verge Recap',
    ruTitle: 'GitHub Agent HQ · конспект The Verge',
  ),
  _DocumentSeed(
    slug: 'wiki_data_localization_russia',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/wiki_data_localization_russia.md',
    ruPath: 'assets/rus/notes/wiki_data_localization_russia.ru.md',
    engTitle: 'Wikipedia · Russia Data Localization',
    ruTitle: 'Wikipedia · локализация данных в РФ',
  ),
  _DocumentSeed(
    slug: 'wiki_selectel_summary',
    kind: DocumentKind.note,
    engPath: 'assets/eng/notes/wiki_selectel_summary.md',
    ruPath: 'assets/rus/notes/wiki_selectel_summary.ru.md',
    engTitle: 'Wikipedia · Selectel Profile',
    ruTitle: 'Wikipedia · профиль Selectel',
  ),
  _DocumentSeed(
    slug: '20251104_anthropic_mcp',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_anthropic_mcp.md',
    ruPath: 'assets/rus/sources/dr1/20251104_anthropic_mcp.md',
    engTitle: 'Anthropic · MCP launch notes',
    ruTitle: 'Anthropic · конспект MCP',
  ),
  _DocumentSeed(
    slug: '20251104_asiatech_shisa',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_asiatech_shisa.md',
    ruPath: 'assets/rus/sources/dr1/20251104_asiatech_shisa.md',
    engTitle: 'AsiaTech Shisa · AI stack',
    ruTitle: 'AsiaTech Shisa · AI-стек',
  ),
  _DocumentSeed(
    slug: '20251104_aws_bedrock_guardrails',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_aws_bedrock_guardrails.md',
    ruPath: 'assets/rus/sources/dr1/20251104_aws_bedrock_guardrails.md',
    engTitle: 'AWS Bedrock · Guardrails',
    ruTitle: 'AWS Bedrock · Guardrails',
  ),
  _DocumentSeed(
    slug: '20251104_azure_foundry_mcp_infoq',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_azure_foundry_mcp_infoq.md',
    ruPath: 'assets/rus/sources/dr1/20251104_azure_foundry_mcp_infoq.md',
    engTitle: 'Azure Foundry · MCP (InfoQ)',
    ruTitle: 'Azure Foundry · MCP (InfoQ)',
  ),
  _DocumentSeed(
    slug: '20251104_cnbctv18_korea_budget_ai',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_cnbctv18_korea_budget_ai.md',
    ruPath: 'assets/rus/sources/dr1/20251104_cnbctv18_korea_budget_ai.md',
    engTitle: 'CNBCTV18 · Korea AI budget',
    ruTitle: 'CNBCTV18 · бюджет ИИ Корея',
  ),
  _DocumentSeed(
    slug: '20251104_eweek_meta_ai_spending',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_eweek_meta_ai_spending.md',
    ruPath: 'assets/rus/sources/dr1/20251104_eweek_meta_ai_spending.md',
    engTitle: 'eWeek · Meta AI spending',
    ruTitle: 'eWeek · затраты Meta на ИИ',
  ),
  _DocumentSeed(
    slug: '20251104_forethought_case_study',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_forethought_case_study.md',
    ruPath: 'assets/rus/sources/dr1/20251104_forethought_case_study.md',
    engTitle: 'Forethought · case study',
    ruTitle: 'Forethought · кейс',
  ),
  _DocumentSeed(
    slug: '20251104_github_agent_hq_infoworld',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_github_agent_hq_infoworld.md',
    ruPath: 'assets/rus/sources/dr1/20251104_github_agent_hq_infoworld.md',
    engTitle: 'GitHub Agent HQ · InfoWorld',
    ruTitle: 'GitHub Agent HQ · InfoWorld',
  ),
  _DocumentSeed(
    slug: '20251104_openai_agentkit_techcrunch',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_openai_agentkit_techcrunch.md',
    ruPath: 'assets/rus/sources/dr1/20251104_openai_agentkit_techcrunch.md',
    engTitle: 'OpenAI AgentKit · TechCrunch',
    ruTitle: 'OpenAI AgentKit · TechCrunch',
  ),
  _DocumentSeed(
    slug: '20251104_thetech_almaty',
    kind: DocumentKind.note,
    engPath: 'assets/eng/sources/dr1/20251104_thetech_almaty.md',
    ruPath: 'assets/rus/sources/dr1/20251104_thetech_almaty.md',
    engTitle: 'TheTech · Almaty digital hub',
    ruTitle: 'TheTech · Алма-Ата цифровой хаб',
  ),
  _DocumentSeed(
    slug: '20251105t134242z_aws_partner_agent_factory',
    kind: DocumentKind.note,
    engPath:
        'assets/eng/sources/dr2/20251105T134242Z_aws_partner_agent_factory.md',
    ruPath:
        'assets/rus/sources/dr2/20251105T134242Z_aws_partner_agent_factory.md',
    engTitle: 'AWS Partner Agent Factory · scrape',
    ruTitle: 'AWS Partner Agent Factory · конспект',
  ),
];
