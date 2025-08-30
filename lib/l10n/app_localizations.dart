import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

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
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Gonzalo García Portfolio'**
  String get appTitle;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get navResume;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @sectionProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get sectionProjects;

  /// No description provided for @sectionResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get sectionResume;

  /// No description provided for @sectionContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get sectionContact;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Gonzalo García'**
  String get heroTitle;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'Software developer with 4 years of experience in Flutter, cloud services, and Generative AI. I design and ship fast, accessible mobile apps, integrating LLMs and end-to-end automations. Obsessed with measuring, optimizing, and scaling without drama.'**
  String get heroDescription;

  /// No description provided for @resumeMySkills.
  ///
  /// In en, this message translates to:
  /// **'My skills'**
  String get resumeMySkills;

  /// No description provided for @resumeExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get resumeExperience;

  /// No description provided for @resumeDownloadCv.
  ///
  /// In en, this message translates to:
  /// **'Download CV (PDF)'**
  String get resumeDownloadCv;

  /// No description provided for @tabDemo.
  ///
  /// In en, this message translates to:
  /// **'Demo'**
  String get tabDemo;

  /// No description provided for @tabCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get tabCode;

  /// No description provided for @tabDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get tabDescription;

  /// No description provided for @btnGooglePlay.
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get btnGooglePlay;

  /// No description provided for @btnOpenGithub.
  ///
  /// In en, this message translates to:
  /// **'Check it on GitHub!'**
  String get btnOpenGithub;

  /// No description provided for @tooltipClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get tooltipClose;

  /// No description provided for @codeViewerMissing.
  ///
  /// In en, this message translates to:
  /// **'No code viewer configured.'**
  String get codeViewerMissing;

  /// No description provided for @btnOpenOnGithub.
  ///
  /// In en, this message translates to:
  /// **'Open on GitHub'**
  String get btnOpenOnGithub;

  /// No description provided for @demoBanner.
  ///
  /// In en, this message translates to:
  /// **'Keep in mind that this project was designed for mobile devices; this is a representative web demo.'**
  String get demoBanner;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactInstagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get contactInstagram;

  /// No description provided for @contactPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhone;

  /// No description provided for @contactLinkedin.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get contactLinkedin;

  /// No description provided for @contactGithub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get contactGithub;

  /// No description provided for @contactTapToOpen.
  ///
  /// In en, this message translates to:
  /// **'Tap to open'**
  String get contactTapToOpen;

  /// No description provided for @exp1Company.
  ///
  /// In en, this message translates to:
  /// **'Cognizant (Google Cloud)'**
  String get exp1Company;

  /// No description provided for @exp1Role.
  ///
  /// In en, this message translates to:
  /// **'Generative AI — SME · Flutter'**
  String get exp1Role;

  /// No description provided for @exp1Period.
  ///
  /// In en, this message translates to:
  /// **'08/2024 – 04/2025'**
  String get exp1Period;

  /// No description provided for @exp1Bullet1.
  ///
  /// In en, this message translates to:
  /// **'Built Flutter apps integrated with Google Cloud AI solutions.'**
  String get exp1Bullet1;

  /// No description provided for @exp1Bullet2.
  ///
  /// In en, this message translates to:
  /// **'Focused on UX, performance and end‑to‑end traceability.'**
  String get exp1Bullet2;

  /// No description provided for @exp2Company.
  ///
  /// In en, this message translates to:
  /// **'Microsoft / LTIM'**
  String get exp2Company;

  /// No description provided for @exp2Role.
  ///
  /// In en, this message translates to:
  /// **'Azure App Services — Platform support'**
  String get exp2Role;

  /// No description provided for @exp2Period.
  ///
  /// In en, this message translates to:
  /// **'10/2023 – 08/2024'**
  String get exp2Period;

  /// No description provided for @exp2Bullet1.
  ///
  /// In en, this message translates to:
  /// **'Diagnosed and resolved platform issues (networking, certificates).'**
  String get exp2Bullet1;

  /// No description provided for @exp2Bullet2.
  ///
  /// In en, this message translates to:
  /// **'Improved reliability and response times.'**
  String get exp2Bullet2;

  /// No description provided for @exp3Company.
  ///
  /// In en, this message translates to:
  /// **'La Plata'**
  String get exp3Company;

  /// No description provided for @exp3Role.
  ///
  /// In en, this message translates to:
  /// **'Flutter/Dart Developer'**
  String get exp3Role;

  /// No description provided for @exp3Period.
  ///
  /// In en, this message translates to:
  /// **'03/2020 – 06/2023'**
  String get exp3Period;

  /// No description provided for @exp3Bullet1.
  ///
  /// In en, this message translates to:
  /// **'Developed cross‑platform apps with Flutter/Dart.'**
  String get exp3Bullet1;

  /// No description provided for @exp3Bullet2.
  ///
  /// In en, this message translates to:
  /// **'Integrated services and applied sound architecture practices.'**
  String get exp3Bullet2;

  /// No description provided for @summaryPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Web portfolio (Flutter Web) with section navigation and a projects modal. Each project includes an embedded demo (with mobile/tablet frame), a GitHub‑backed code viewer, and a tag‑rich description. Animated UI with Material 3, responsive layout, keyboard/focus support and deployment on GitHub Pages.'**
  String get summaryPortfolio;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
