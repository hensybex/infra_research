// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Infra Research Hub';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageEn => 'Английский';

  @override
  String get navDr1 => 'Исследование 1';

  @override
  String get navDr2 => 'Исследование 2';

  @override
  String get navDr25 => 'Исследование 3';

  @override
  String get navDr3 => 'Исследование 4';

  @override
  String get navProfile => 'Профиль';

  @override
  String get sourcesTitle => 'Источники';

  @override
  String get contentsTitle => 'Оглавление';

  @override
  String get loadingLabel => 'Загружаем отчёты...';

  @override
  String get loadingError => 'Не удалось загрузить отчёты.';

  @override
  String get reportNotFound => 'Отчёт не найден.';

  @override
  String get sourceUnavailable => 'Источник пока недоступен.';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileLeadershipHeading => 'Дуэт лидеров';

  @override
  String get profileLeadershipIntro =>
      'Фаундерский CEO/CTO плюс продукт-партнёр ведут сделку от discovery до подписи.';

  @override
  String get profileTimLabel => 'Тим (CEO & CTO)';

  @override
  String get profileTimInfo => 'UTC+3 · AIOps lab · Enterprise-сделки';

  @override
  String get profileRitaLabel => 'Рита (Product Partner)';

  @override
  String get profileRitaInfo => 'UTC+7 · AI GTM · Delivery-операции';

  @override
  String get profileReachHeading => 'Как связаться быстро';

  @override
  String get profileTelegramLabel => 'Telegram';

  @override
  String get profileSla => 'SLA: ответ ≤24ч в рабочие дни';

  @override
  String get profilePitchHeading => 'Ресёрч-пакет';

  @override
  String get profilePitchBody =>
      'Оффлайн ZIP с Исследованиями 1–4, двуязычными заметками и местом для рекомендательных писем.';

  @override
  String get profilePitchDownload => 'Скачать пакет';

  @override
  String get profilePitchShare => 'Поделиться пакетом';

  @override
  String get profilePitchSaveSuccess => 'Ресёрч-пакет сохранён локально.';

  @override
  String get profilePitchSaveError =>
      'Не удалось сохранить пакет. Повторите попытку.';

  @override
  String get profileLettersHeading => 'Рекомендательные письма';

  @override
  String get profileLettersBody =>
      'Живые Google Docs с цитатами due diligence. При экспорте PDF попадут внутрь ресёрч-пакета.';

  @override
  String get profileLettersOpenCta => 'Открыть письмо';

  @override
  String get profileLettersPendingLabel => 'Письмо в пути';

  @override
  String get profileLettersStatusLive => 'Готово';

  @override
  String get profileLettersStatusPending => 'Ожидается';

  @override
  String get detailShare => 'Поделиться';

  @override
  String get detailCopyQuote => 'Скопировать цитату';

  @override
  String get detailPdf => 'PDF';

  @override
  String get detailDocx => 'DOCX';

  @override
  String get detailComingSoon => 'Скоро';

  @override
  String get notePreviewTitle => 'Предпросмотр заметки';

  @override
  String get noteMissing => 'Источник появится после обновления.';

  @override
  String get notesUnavailable => 'Заметка отсутствует в пакете.';

  @override
  String get comingSoonDialog => 'Файл появится в следующем пакете.';

  @override
  String get sharePackMessage => 'Пакет Infra Research';

  @override
  String get noteUnavailableTitle => 'Источник в пути';

  @override
  String get tagArchitecture => 'Архитектура';

  @override
  String get tagRoadmap => 'Дорожная карта';

  @override
  String get tagCompliance => 'Комплаенс';

  @override
  String get tagValue => 'Ценность';

  @override
  String get noteButtonOpen => 'Открыть заметку';

  @override
  String get presentationCardTitle => 'Запустить презентацию';

  @override
  String get presentationCardBody =>
      'Показать оффлайн-деку прямо в приложении. Работает без интернета.';

  @override
  String get presentationLaunchCta => 'Запустить деку';

  @override
  String get presentationTitle => 'Infra Deck';

  @override
  String get presentationLoadError => 'Файл презентации отсутствует в сборке.';

  @override
  String get presentationCloseCta => 'Закрыть деку';
}
