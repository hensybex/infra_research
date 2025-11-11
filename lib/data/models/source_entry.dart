enum SourceType { internal, external, missing }

class SourceEntry {
  const SourceEntry({
    required this.reportId,
    required this.label,
    required this.type,
    this.reference,
  });

  final String reportId;
  final String label;
  final SourceType type;
  final String? reference;
}
