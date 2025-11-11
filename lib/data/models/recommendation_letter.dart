enum RecommendationLetterStatus { available, incoming }

class RecommendationLetter {
  const RecommendationLetter({
    required this.id,
    required this.partner,
    required this.role,
    required this.summary,
    this.url,
    this.note,
    this.status = RecommendationLetterStatus.available,
  });

  final String id;
  final String partner;
  final String role;
  final Map<String, String> summary;
  final String? url;
  final Map<String, String>? note;
  final RecommendationLetterStatus status;

  bool get isAvailable =>
      url != null && status == RecommendationLetterStatus.available;

  String summaryFor(String languageCode) =>
      summary[languageCode] ?? summary['en'] ?? summary.values.first;

  String? noteFor(String languageCode) => note?[languageCode] ?? note?['en'];
}
