import 'package:infra/data/models/report_tag.dart';
import 'package:infra/data/models/source_entry.dart';

class ReportDocument {
  const ReportDocument({
    required this.id,
    required this.code,
    required this.title,
    required this.path,
    required this.languageCode,
    required this.sections,
    required this.body,
    required this.wordCount,
    required this.tags,
    required this.summary,
    required this.sources,
  });

  final String id;
  final String code;
  final String title;
  final String path;
  final String languageCode;
  final List<ReportSection> sections;
  final String body;
  final int wordCount;
  final Set<ReportTag> tags;
  final String? summary;
  final List<SourceEntry> sources;
}

class ReportSection {
  const ReportSection({
    required this.anchor,
    required this.title,
    required this.level,
  });

  final String anchor;
  final String title;
  final int level;
}
