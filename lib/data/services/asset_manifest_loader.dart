import 'dart:convert';

import 'package:flutter/services.dart';

class AssetManifestLoader {
  const AssetManifestLoader();

  Future<List<String>> listAssets(String prefix) async {
    final raw = await rootBundle.loadString('AssetManifest.json');
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      return const [];
    }

    return decoded.keys
        .where((key) => key.startsWith(prefix))
        .map((key) => key.toString())
        .toList();
  }
}
