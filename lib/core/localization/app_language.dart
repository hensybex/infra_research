import 'package:flutter/widgets.dart';

enum AppLanguage { ru, en }

extension AppLanguageX on AppLanguage {
  Locale get locale {
    switch (this) {
      case AppLanguage.ru:
        return const Locale('ru');
      case AppLanguage.en:
        return const Locale('en');
    }
  }

  String get assetSegment {
    switch (this) {
      case AppLanguage.ru:
        return 'rus';
      case AppLanguage.en:
        return 'eng';
    }
  }

  String get languageCode {
    switch (this) {
      case AppLanguage.ru:
        return 'ru';
      case AppLanguage.en:
        return 'en';
    }
  }

  String get emoji {
    switch (this) {
      case AppLanguage.ru:
        return '🇷🇺';
      case AppLanguage.en:
        return '🇬🇧';
    }
  }
}
