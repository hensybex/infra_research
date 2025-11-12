enum RecommendationLetterStatus { available, incoming }

class RecommendationLetter {
  const RecommendationLetter({
    required this.id,
    required this.partner,
    required this.role,
    required this.summary,
    this.url,
    this.assetPath,
    this.note,
    this.status = RecommendationLetterStatus.available,
  });

  final String id;
  final String partner;
  final String role;
  final Map<String, String> summary;
  final String? url;
  final String? assetPath;
  final Map<String, String>? note;
  final RecommendationLetterStatus status;

  bool get hasAsset => assetPath != null && assetPath!.isNotEmpty;

  bool get isTextAsset => hasAsset && assetPath!.toLowerCase().endsWith('.txt');

  bool get isFileAsset => hasAsset && !isTextAsset;

  String? get assetFileName => hasAsset ? assetPath!.split('/').last : null;

  String? get assetExtension {
    final name = assetFileName;
    if (name == null) return null;
    final dotIndex = name.lastIndexOf('.');
    if (dotIndex == -1 || dotIndex == name.length - 1) {
      return null;
    }
    return name.substring(dotIndex + 1);
  }

  bool get isAvailable =>
      status == RecommendationLetterStatus.available &&
      (url != null || hasAsset);

  String summaryFor(String languageCode) =>
      summary[languageCode] ?? summary['en'] ?? summary.values.first;

  String? noteFor(String languageCode) => note?[languageCode] ?? note?['en'];
}
