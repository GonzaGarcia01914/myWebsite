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
  /// **'Senior Flutter Engineer with 5+ years of experience building production-grade cross-platform apps, including embedded-integrated UIs and device-connected features. Strong expertise in Flutter/Dart, custom widgets, animations, and high-performance UI architecture. Focused on reliability, performance profiling, and seamless UI–hardware communication in constrained environments.'**
  String get heroDescription;

  /// No description provided for @resumeMySkills.
  ///
  /// In en, this message translates to:
  /// **'Core skills'**
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
  /// **'Cognizant'**
  String get exp1Company;

  /// No description provided for @exp1Role.
  ///
  /// In en, this message translates to:
  /// **'Senior Flutter Engineer & UI/Embedded Integration'**
  String get exp1Role;

  /// No description provided for @exp1Period.
  ///
  /// In en, this message translates to:
  /// **'2024 – 2025'**
  String get exp1Period;

  /// No description provided for @exp1Bullet1.
  ///
  /// In en, this message translates to:
  /// **'Developed advanced Flutter UI components interacting with backend AI and microservices.'**
  String get exp1Bullet1;

  /// No description provided for @exp1Bullet2.
  ///
  /// In en, this message translates to:
  /// **'Collaborated with embedded and systems engineers to ensure seamless UI integration with lower-level services.'**
  String get exp1Bullet2;

  /// No description provided for @exp2Company.
  ///
  /// In en, this message translates to:
  /// **'Microsoft / LTI Mindtree'**
  String get exp2Company;

  /// No description provided for @exp2Role.
  ///
  /// In en, this message translates to:
  /// **'Azure App Services Engineer'**
  String get exp2Role;

  /// No description provided for @exp2Period.
  ///
  /// In en, this message translates to:
  /// **'2023 – 2024'**
  String get exp2Period;

  /// No description provided for @exp2Bullet1.
  ///
  /// In en, this message translates to:
  /// **'Troubleshot complex systems, network communication endpoints, and certificate-based authentication.'**
  String get exp2Bullet1;

  /// No description provided for @exp2Bullet2.
  ///
  /// In en, this message translates to:
  /// **'Maintained high reliability and operational performance of deployed cloud services.'**
  String get exp2Bullet2;

  /// No description provided for @exp3Company.
  ///
  /// In en, this message translates to:
  /// **'La Plata'**
  String get exp3Company;

  /// No description provided for @exp3Role.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get exp3Role;

  /// No description provided for @exp3Period.
  ///
  /// In en, this message translates to:
  /// **'2020 – 2023'**
  String get exp3Period;

  /// No description provided for @exp3Bullet1.
  ///
  /// In en, this message translates to:
  /// **'Built and deployed multiple production Flutter applications.'**
  String get exp3Bullet1;

  /// No description provided for @exp3Bullet2.
  ///
  /// In en, this message translates to:
  /// **'Designed reusable UI components, implemented state management, and delivered responsive layouts.'**
  String get exp3Bullet2;

  /// No description provided for @exp1Desc.
  ///
  /// In en, this message translates to:
  /// **'As a Senior Flutter Engineer at Cognizant, I developed advanced Flutter UI components integrated with backend AI and microservices. I worked closely with embedded and systems engineers to ensure reliable UI–hardware communication, applying performance optimization strategies for constrained environments. I also contributed to architecture decisions, code reviews, and component reusability.'**
  String get exp1Desc;

  /// No description provided for @exp2Desc.
  ///
  /// In en, this message translates to:
  /// **'At Microsoft Azure App Services (via LTI Mindtree), I worked in Linux-based cloud environments and service communication layers. I diagnosed and resolved complex platform and software issues, focusing on networking and certificate-based service authentication. I contributed to improving service reliability and operational performance for enterprise workloads.'**
  String get exp2Desc;

  /// No description provided for @exp3Desc.
  ///
  /// In en, this message translates to:
  /// **'At La Plata, I built and deployed cross-platform applications using Flutter and Dart. I designed reusable UI components, implemented state management, and delivered responsive layouts across multiple device sizes. I also integrated Flutter apps with native OS services and external APIs.'**
  String get exp3Desc;

  /// No description provided for @summaryPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Web portfolio (Flutter Web) with section navigation and a projects modal. Each project includes an embedded demo (with mobile/tablet frame), a GitHub-backed code viewer, and a tag-rich description. Animated UI with Material 3, responsive layout, keyboard/focus support, and deployment on GitHub Pages.'**
  String get summaryPortfolio;

  /// No description provided for @summaryMovies.
  ///
  /// In en, this message translates to:
  /// **'Mobile app to explore TMDb content (now playing, popular, search, details, cast, and recommendations). Uses a Firebase Cloud Functions proxy to secure API keys and serve data, showcasing clean architecture, state management, and production-grade integration.'**
  String get summaryMovies;

  /// No description provided for @summaryMestura.
  ///
  /// In en, this message translates to:
  /// **'AI cooking assistant that generates recipes from ingredients or cravings. Adjust servings, time, and skill level; respects diets and restrictions. Includes step-by-step cooking mode with timers, offline favorites + shopping list, deep links, and multi-language support. Monetized with spaced interstitial ads.'**
  String get summaryMestura;

  /// No description provided for @projectMoviesTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Movies Portfolio'**
  String get projectMoviesTitle;

  /// No description provided for @projectMoviesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TMDb explorer, favorites and cache; Firebase Functions proxy backend.'**
  String get projectMoviesSubtitle;

  /// No description provided for @projectMesturaTitle.
  ///
  /// In en, this message translates to:
  /// **'Mestura – Your cooking AI assistant'**
  String get projectMesturaTitle;

  /// No description provided for @projectMesturaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI-powered assistant to generate and cook recipes.'**
  String get projectMesturaSubtitle;

  /// No description provided for @projectPortfolioTitle.
  ///
  /// In en, this message translates to:
  /// **'This page was also made with Flutter!'**
  String get projectPortfolioTitle;

  /// No description provided for @projectPortfolioSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Portfolio built with Flutter Web'**
  String get projectPortfolioSubtitle;

  /// No description provided for @summaryPumpIt.
  ///
  /// In en, this message translates to:
  /// **'Pump It Baby is a Flutter app (desktop/web) that monitors featured memecoins on pump.fun in real time and orchestrates an auto-invest bot. The UI is feature-driven and state is managed with Riverpod: FeaturedCoinNotifier handles discovery/filters/insights, AutoInvestNotifier manages configuration and positions, and AutoInvestExecutor watches state changes to decide and execute swaps. The services layer encapsulates data clients (pump.fun, Solana RPC/WS, Helius Enhanced API), execution providers (Jupiter/PumpPortal), wallet providers (local keypair on desktop, Phantom on web), and analytics/AI (optional OpenAI). The architecture cleanly separates data acquisition, decision logic, and execution, with fast confirmations via WebSocket and an HTTP RPC fallback for resilience.'**
  String get summaryPumpIt;

  /// No description provided for @projectPumpItTitle.
  ///
  /// In en, this message translates to:
  /// **'PumpIt'**
  String get projectPumpItTitle;

  /// No description provided for @projectPumpItSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Meme coins trading bot and platform'**
  String get projectPumpItSubtitle;

  /// No description provided for @btnWatchYoutube.
  ///
  /// In en, this message translates to:
  /// **'Watch on YouTube'**
  String get btnWatchYoutube;

  /// No description provided for @tabVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get tabVideo;
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
