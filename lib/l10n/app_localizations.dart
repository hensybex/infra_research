import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Infra Research Hub'**
  String get appTitle;

  /// No description provided for @languageRu.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRu;

  /// No description provided for @languageEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEn;

  /// No description provided for @navDr1.
  ///
  /// In en, this message translates to:
  /// **'Stack Proof'**
  String get navDr1;

  /// No description provided for @navDr2.
  ///
  /// In en, this message translates to:
  /// **'Launch Blueprint'**
  String get navDr2;

  /// No description provided for @navDr25.
  ///
  /// In en, this message translates to:
  /// **'Market Bridge'**
  String get navDr25;

  /// No description provided for @navDr3.
  ///
  /// In en, this message translates to:
  /// **'Value Engine'**
  String get navDr3;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @sourcesTitle.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get sourcesTitle;

  /// No description provided for @contentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get contentsTitle;

  /// No description provided for @loadingLabel.
  ///
  /// In en, this message translates to:
  /// **'Loading research...'**
  String get loadingLabel;

  /// No description provided for @loadingError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load reports.'**
  String get loadingError;

  /// No description provided for @reportNotFound.
  ///
  /// In en, this message translates to:
  /// **'Report not found.'**
  String get reportNotFound;

  /// No description provided for @sourceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Source not available yet.'**
  String get sourceUnavailable;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileLeadershipHeading.
  ///
  /// In en, this message translates to:
  /// **'Leadership duo'**
  String get profileLeadershipHeading;

  /// No description provided for @profileLeadershipIntro.
  ///
  /// In en, this message translates to:
  /// **'Founder-grade CEO/CTO paired with a product partner covering discovery to signature.'**
  String get profileLeadershipIntro;

  /// No description provided for @profileTimLabel.
  ///
  /// In en, this message translates to:
  /// **'Tim (CEO & CTO)'**
  String get profileTimLabel;

  /// No description provided for @profileTimInfo.
  ///
  /// In en, this message translates to:
  /// **'UTC+3 · AIOps lab · Enterprise dealmaking'**
  String get profileTimInfo;

  /// No description provided for @profileRitaLabel.
  ///
  /// In en, this message translates to:
  /// **'Rita (Product Partner)'**
  String get profileRitaLabel;

  /// No description provided for @profileRitaInfo.
  ///
  /// In en, this message translates to:
  /// **'UTC+7 · AI GTM · Delivery ops'**
  String get profileRitaInfo;

  /// No description provided for @profileReachHeading.
  ///
  /// In en, this message translates to:
  /// **'Reach us fast'**
  String get profileReachHeading;

  /// No description provided for @profileTelegramLabel.
  ///
  /// In en, this message translates to:
  /// **'Telegram'**
  String get profileTelegramLabel;

  /// No description provided for @profileSla.
  ///
  /// In en, this message translates to:
  /// **'SLA: 24h weekday response'**
  String get profileSla;

  /// No description provided for @profilePitchHeading.
  ///
  /// In en, this message translates to:
  /// **'Research pack'**
  String get profilePitchHeading;

  /// No description provided for @profilePitchBody.
  ///
  /// In en, this message translates to:
  /// **'Offline ZIP with Research Papers 1–4, bilingual notes, and bundled recommendation letters ready to forward.'**
  String get profilePitchBody;

  /// No description provided for @profilePitchDownload.
  ///
  /// In en, this message translates to:
  /// **'Download pack'**
  String get profilePitchDownload;

  /// No description provided for @profilePitchShare.
  ///
  /// In en, this message translates to:
  /// **'Share pack'**
  String get profilePitchShare;

  /// No description provided for @profilePitchSaveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Research pack saved locally.'**
  String get profilePitchSaveSuccess;

  /// No description provided for @profilePitchSaveError.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t save the pack. Try again.'**
  String get profilePitchSaveError;

  /// No description provided for @profileLettersHeading.
  ///
  /// In en, this message translates to:
  /// **'Recommendation letters'**
  String get profileLettersHeading;

  /// No description provided for @profileLettersBody.
  ///
  /// In en, this message translates to:
  /// **'Letters sit below: TXT opens inline, DOCX saves locally so it can be co-signed without leaving the app.'**
  String get profileLettersBody;

  /// No description provided for @profileLettersOpenCta.
  ///
  /// In en, this message translates to:
  /// **'Open letter'**
  String get profileLettersOpenCta;

  /// No description provided for @profileLettersReadCta.
  ///
  /// In en, this message translates to:
  /// **'Read letter'**
  String get profileLettersReadCta;

  /// No description provided for @profileLettersDownloadCta.
  ///
  /// In en, this message translates to:
  /// **'Save letter'**
  String get profileLettersDownloadCta;

  /// No description provided for @profileLettersPendingLabel.
  ///
  /// In en, this message translates to:
  /// **'Letter planned'**
  String get profileLettersPendingLabel;

  /// No description provided for @profileLettersStatusLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get profileLettersStatusLive;

  /// No description provided for @profileLettersStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Incoming'**
  String get profileLettersStatusPending;

  /// No description provided for @profileLettersDownloadSuccess.
  ///
  /// In en, this message translates to:
  /// **'Letter saved locally.'**
  String get profileLettersDownloadSuccess;

  /// No description provided for @profileLettersDownloadError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load the letter. Try again.'**
  String get profileLettersDownloadError;

  /// No description provided for @detailShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get detailShare;

  /// No description provided for @detailCopyQuote.
  ///
  /// In en, this message translates to:
  /// **'Copy Quote'**
  String get detailCopyQuote;

  /// No description provided for @detailPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get detailPdf;

  /// No description provided for @detailDocx.
  ///
  /// In en, this message translates to:
  /// **'DOCX'**
  String get detailDocx;

  /// No description provided for @detailComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Available soon'**
  String get detailComingSoon;

  /// No description provided for @notePreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Note Preview'**
  String get notePreviewTitle;

  /// No description provided for @noteMissing.
  ///
  /// In en, this message translates to:
  /// **'Source will appear after the next update.'**
  String get noteMissing;

  /// No description provided for @notesUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Note is not bundled in the offline package.'**
  String get notesUnavailable;

  /// No description provided for @comingSoonDialog.
  ///
  /// In en, this message translates to:
  /// **'File will be available in the next drop.'**
  String get comingSoonDialog;

  /// No description provided for @sharePackMessage.
  ///
  /// In en, this message translates to:
  /// **'Infra research pack'**
  String get sharePackMessage;

  /// No description provided for @noteUnavailableTitle.
  ///
  /// In en, this message translates to:
  /// **'Source Pending'**
  String get noteUnavailableTitle;

  /// No description provided for @tagArchitecture.
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get tagArchitecture;

  /// No description provided for @tagRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Roadmap'**
  String get tagRoadmap;

  /// No description provided for @tagCompliance.
  ///
  /// In en, this message translates to:
  /// **'Compliance'**
  String get tagCompliance;

  /// No description provided for @tagValue.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get tagValue;

  /// No description provided for @noteButtonOpen.
  ///
  /// In en, this message translates to:
  /// **'Open note'**
  String get noteButtonOpen;

  /// No description provided for @presentationCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Launch presentation'**
  String get presentationCardTitle;

  /// No description provided for @presentationCardBody.
  ///
  /// In en, this message translates to:
  /// **'Show the presentation with the core research storyline.'**
  String get presentationCardBody;

  /// No description provided for @presentationLaunchCta.
  ///
  /// In en, this message translates to:
  /// **'Launch deck'**
  String get presentationLaunchCta;

  /// No description provided for @presentationTitle.
  ///
  /// In en, this message translates to:
  /// **'Infra Deck'**
  String get presentationTitle;

  /// No description provided for @presentationLoadError.
  ///
  /// In en, this message translates to:
  /// **'Deck asset is missing in this build.'**
  String get presentationLoadError;

  /// No description provided for @presentationCloseCta.
  ///
  /// In en, this message translates to:
  /// **'Exit deck'**
  String get presentationCloseCta;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
