import 'package:flutter/material.dart';
import 'package:infra/core/localization/app_language.dart';

class LanguageController extends ChangeNotifier {
  AppLanguage _language = AppLanguage.ru;

  AppLanguage get language => _language;
  Locale get locale => _language.locale;

  void update(AppLanguage language) {
    if (_language == language) return;
    _language = language;
    notifyListeners();
  }
}
