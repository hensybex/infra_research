enum ReportTag { architecture, roadmap, compliance, value }

extension ReportTagX on ReportTag {
  String get code {
    switch (this) {
      case ReportTag.architecture:
        return 'architecture';
      case ReportTag.roadmap:
        return 'roadmap';
      case ReportTag.compliance:
        return 'compliance';
      case ReportTag.value:
        return 'value';
    }
  }
}
