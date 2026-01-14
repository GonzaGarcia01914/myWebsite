// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Gonzalo García Portfolio';

  @override
  String get navProjects => 'Projects';

  @override
  String get navResume => 'Resume';

  @override
  String get navContact => 'Contact';

  @override
  String get sectionProjects => 'Projects';

  @override
  String get sectionResume => 'Resume';

  @override
  String get sectionContact => 'Contact';

  @override
  String get heroTitle => 'Gonzalo García';

  @override
  String get heroDescription => 'Senior Flutter Engineer with 5+ years of experience building production-grade cross-platform apps, including embedded-integrated UIs and device-connected features. Strong expertise in Flutter/Dart, custom widgets, animations, and high-performance UI architecture. Focused on reliability, performance profiling, and seamless UI–hardware communication in constrained environments.';

  @override
  String get resumeMySkills => 'Core skills';

  @override
  String get resumeExperience => 'Experience';

  @override
  String get resumeDownloadCv => 'Download CV (PDF)';

  @override
  String get tabDemo => 'Demo';

  @override
  String get tabCode => 'Code';

  @override
  String get tabDescription => 'Description';

  @override
  String get tabVideo => 'Video';

  @override
  String get btnGooglePlay => 'Google Play';

  @override
  String get btnOpenGithub => 'Check it on GitHub!';

  @override
  String get tooltipClose => 'Close';

  @override
  String get codeViewerMissing => 'No code viewer configured.';

  @override
  String get btnOpenOnGithub => 'Open on GitHub';

  @override
  String get btnWatchYoutube => 'Watch on YouTube';

  @override
  String get demoBanner => 'Keep in mind that this project was designed for mobile devices; this is a representative web demo.';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactInstagram => 'Instagram';

  @override
  String get contactPhone => 'Phone';

  @override
  String get contactLinkedin => 'LinkedIn';

  @override
  String get contactGithub => 'GitHub';

  @override
  String get contactTapToOpen => 'Tap to open';

  @override
  String get exp1Company => 'Cognizant';

  @override
  String get exp1Role => 'Senior Flutter Engineer & UI/Embedded Integration';

  @override
  String get exp1Period => '2024 – 2025';

  @override
  String get exp1Bullet1 => 'Developed advanced Flutter UI components interacting with backend AI and microservices.';

  @override
  String get exp1Bullet2 => 'Collaborated with embedded and systems engineers to ensure seamless UI integration with lower-level services.';

  @override
  String get exp2Company => 'Microsoft / LTI Mindtree';

  @override
  String get exp2Role => 'Azure App Services Engineer';

  @override
  String get exp2Period => '2023 – 2024';

  @override
  String get exp2Bullet1 => 'Troubleshot complex systems, network communication endpoints, and certificate-based authentication.';

  @override
  String get exp2Bullet2 => 'Maintained high reliability and operational performance of deployed cloud services.';

  @override
  String get exp3Company => 'La Plata';

  @override
  String get exp3Role => 'Flutter Developer';

  @override
  String get exp3Period => '2020 – 2023';

  @override
  String get exp3Bullet1 => 'Built and deployed multiple production Flutter applications.';

  @override
  String get exp3Bullet2 => 'Designed reusable UI components, implemented state management, and delivered responsive layouts.';

  @override
  String get exp1Desc => 'As a Senior Flutter Engineer at Cognizant, I developed advanced Flutter UI components integrated with backend AI and microservices. I worked closely with embedded and systems engineers to ensure reliable UI–hardware communication, applying performance optimization strategies for constrained environments. I also contributed to architecture decisions, code reviews, and component reusability.';

  @override
  String get exp2Desc => 'At Microsoft Azure App Services (via LTI Mindtree), I worked in Linux-based cloud environments and service communication layers. I diagnosed and resolved complex platform and software issues, focusing on networking and certificate-based service authentication. I contributed to improving service reliability and operational performance for enterprise workloads.';

  @override
  String get exp3Desc => 'At La Plata, I built and deployed cross-platform applications using Flutter and Dart. I designed reusable UI components, implemented state management, and delivered responsive layouts across multiple device sizes. I also integrated Flutter apps with native OS services and external APIs.';

  @override
  String get summaryPortfolio => 'Web portfolio (Flutter Web) with section navigation and a projects modal. Each project includes an embedded demo (with mobile/tablet frame), a GitHub-backed code viewer, and a tag-rich description. Animated UI with Material 3, responsive layout, keyboard/focus support, and deployment on GitHub Pages.';

  @override
  String get summaryMovies => 'Mobile app to explore TMDb content (now playing, popular, search, details, cast, and recommendations). Uses a Firebase Cloud Functions proxy to secure API keys and serve data, showcasing clean architecture, state management, and production-grade integration.';

  @override
  String get summaryMestura => 'AI cooking assistant that generates recipes from ingredients or cravings. Adjust servings, time, and skill level; respects diets and restrictions. Includes step-by-step cooking mode with timers, offline favorites + shopping list, deep links, and multi-language support. Monetized with spaced interstitial ads.';


  @override
  String get summaryPumpIt => 'Pump It Baby is a Flutter app (desktop/web) that monitors featured memecoins on pump.fun in real time and orchestrates an auto-invest bot. The UI is feature-driven and state is managed with Riverpod: FeaturedCoinNotifier handles discovery/filters/insights, AutoInvestNotifier manages configuration and positions, and AutoInvestExecutor watches state changes to decide and execute swaps. The services layer encapsulates data clients (pump.fun, Solana RPC/WS, Helius Enhanced API), execution providers (Jupiter/PumpPortal), wallet providers (local keypair on desktop, Phantom on web), and analytics/AI (optional OpenAI). The architecture cleanly separates data acquisition, decision logic, and execution, with fast confirmations via WebSocket and an HTTP RPC fallback for resilience.';

  @override
  String get projectMoviesTitle => 'Flutter Movies Portfolio';

  @override
  String get projectMoviesSubtitle => 'TMDb explorer, favorites and cache; Firebase Functions proxy backend.';

  @override
  String get projectMesturaTitle => 'Mestura – Your cooking AI assistant';

  @override
  String get projectMesturaSubtitle => 'AI-powered assistant to generate and cook recipes.';


  @override
  String get projectPumpItTitle => 'PumpIt';

  @override
  String get projectPumpItSubtitle => 'Workout and progress tracker.';

  @override
  String get projectPortfolioTitle => 'This page was also made with Flutter!';

  @override
  String get projectPortfolioSubtitle => 'Portfolio built with Flutter Web';
}
