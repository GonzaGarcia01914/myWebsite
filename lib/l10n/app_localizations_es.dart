// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Portafolio de Gonzalo García';

  @override
  String get navProjects => 'Proyectos';

  @override
  String get navResume => 'Currículum';

  @override
  String get navContact => 'Contacto';

  @override
  String get sectionProjects => 'Proyectos';

  @override
  String get sectionResume => 'Currículum';

  @override
  String get sectionContact => 'Contacto';

  @override
  String get heroTitle => 'Gonzalo García';

  @override
  String get heroDescription => 'Senior Flutter Engineer con más de 5 años de experiencia desarrollando aplicaciones multiplataforma listas para producción, incluyendo interfaces integradas con sistemas embebidos y funciones conectadas a dispositivos. Fuerte dominio de Flutter/Dart, widgets personalizados, animaciones y arquitectura de UI de alto rendimiento. Enfocado en fiabilidad, profiling de performance y comunicación estable entre UI y hardware en entornos con recursos limitados.';

  @override
  String get resumeMySkills => 'Habilidades principales';

  @override
  String get resumeExperience => 'Experiencia';

  @override
  String get resumeDownloadCv => 'Descargar CV (PDF)';

  @override
  String get tabDemo => 'Demo';

  @override
  String get tabCode => 'Código';

  @override
  String get tabDescription => 'Descripción';

  @override
  String get btnGooglePlay => 'Google Play';

  @override
  String get btnOpenGithub => '¡Ver en GitHub!';

  @override
  String get tooltipClose => 'Cerrar';

  @override
  String get codeViewerMissing => 'No hay visor de código configurado.';

  @override
  String get btnOpenOnGithub => 'Abrir en GitHub';

  @override
  String get demoBanner => 'Ten en cuenta que este proyecto fue diseñado para dispositivos móviles; esta es una demo web representativa.';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactInstagram => 'Instagram';

  @override
  String get contactPhone => 'Teléfono';

  @override
  String get contactLinkedin => 'LinkedIn';

  @override
  String get contactGithub => 'GitHub';

  @override
  String get contactTapToOpen => 'Toca para abrir';

  @override
  String get exp1Company => 'Cognizant';

  @override
  String get exp1Role => 'Senior Flutter Engineer & Integración UI/Embebidos';

  @override
  String get exp1Period => '2024 – 2025';

  @override
  String get exp1Bullet1 => 'Desarrollé componentes avanzados de UI en Flutter integrados con backend de IA y microservicios.';

  @override
  String get exp1Bullet2 => 'Colaboré con equipos de embebidos y sistemas para asegurar una integración fluida entre UI y servicios de bajo nivel.';

  @override
  String get exp2Company => 'Microsoft / LTI Mindtree';

  @override
  String get exp2Role => 'Azure App Services Engineer';

  @override
  String get exp2Period => '2023 – 2024';

  @override
  String get exp2Bullet1 => 'Resolví incidencias complejas de plataforma y software, enfocándome en networking y certificados.';

  @override
  String get exp2Bullet2 => 'Contribuí a mejorar la fiabilidad y el rendimiento operativo de servicios cloud desplegados.';

  @override
  String get exp3Company => 'La Plata';

  @override
  String get exp3Role => 'Flutter Developer';

  @override
  String get exp3Period => '2020 – 2023';

  @override
  String get exp3Bullet1 => 'Desarrollé y publiqué múltiples aplicaciones Flutter en producción.';

  @override
  String get exp3Bullet2 => 'Diseñé componentes reutilizables, implementé gestión de estado y construí layouts responsive.';

  @override
  String get exp1Desc => 'Como Senior Flutter Engineer en Cognizant, desarrollé componentes avanzados de UI en Flutter integrados con backend de IA y microservicios. Trabajé junto a equipos de embebidos y sistemas para asegurar una comunicación estable entre la UI y el hardware, aplicando estrategias de optimización en entornos con recursos limitados. También participé en decisiones de arquitectura, code reviews y reutilización de componentes.';

  @override
  String get exp2Desc => 'En Microsoft Azure App Services (a través de LTI Mindtree), trabajé en entornos cloud basados en Linux y capas de comunicación entre servicios. Diagnostiqué y resolví problemas complejos de plataforma y software, con foco en networking y autenticación mediante certificados. Contribuí a mejorar la fiabilidad del servicio y el rendimiento operativo para cargas enterprise.';

  @override
  String get exp3Desc => 'En La Plata, participé en el desarrollo de aplicaciones multiplataforma con Flutter y Dart. Diseñé componentes de UI reutilizables, implementé gestión de estado y aseguré layouts responsive para diferentes tamaños de pantalla. También integré Flutter con servicios nativos del sistema operativo y APIs externas.';

  @override
  String get summaryPortfolio => 'Portafolio web (Flutter Web) con navegación por secciones y modal de proyectos. Cada proyecto incluye una demo embebida (con marco móvil/tablet), visor de código conectado a GitHub y descripción con tags. UI animada con Material 3, layout responsive, soporte de teclado/focus y despliegue en GitHub Pages.';

  @override
  String get summaryMovies => 'App móvil para explorar contenido de TMDb (estrenos, populares, búsqueda, detalles, reparto y recomendaciones). Usa un proxy en Firebase Cloud Functions para proteger las API keys y servir datos, demostrando clean architecture, gestión de estado e integración lista para producción.';

  @override
  String get summaryMestura => 'Asistente de cocina con IA que genera recetas según ingredientes o antojos. Permite ajustar porciones, tiempo y nivel; respeta dietas y restricciones. Incluye modo de cocina paso a paso con temporizadores, favoritos offline + lista de compras, deep links y soporte multi-idioma. Monetizado con anuncios interstitial espaciados.';

  @override
  String get projectMoviesTitle => 'Flutter Movies Portfolio';

  @override
  String get projectMoviesSubtitle => 'Explorador de TMDb, favoritos y caché; backend proxy con Firebase Functions.';

  @override
  String get projectMesturaTitle => 'Mestura – Tu asistente de cocina con IA';

  @override
  String get projectMesturaSubtitle => 'Asistente con IA para generar y cocinar recetas.';

  @override
  String get projectPortfolioTitle => '¡Esta página también está hecha con Flutter!';

  @override
  String get projectPortfolioSubtitle => 'Portafolio construido con Flutter Web';

  @override
  String get summaryPumpIt => 'Pump It Baby es una app Flutter (desktop/web) que monitorea memecoins featured de pump.fun en tiempo real y orquesta un bot de auto-invest. La UI esta organizada por features y el estado se maneja con Riverpod: FeaturedCoinNotifier controla discovery/filters/insights, AutoInvestNotifier mantiene configuracion y posiciones, y AutoInvestExecutor observa el estado para decidir y ejecutar swaps. La capa de servicios encapsula clientes de datos (pump.fun, Solana RPC/WS, Helius Enhanced API), ejecucion (Jupiter/PumpPortal), wallet providers (keypair local en desktop, Phantom en web) y analisis/IA (OpenAI opcional). La arquitectura separa adquisicion de datos, logica de decision y ejecucion, con confirmaciones rapidas via WebSocket y fallback a RPC HTTP para resiliencia.';

  @override
  String get projectPumpItTitle => 'PumpIt';

  @override
  String get projectPumpItSubtitle => 'Bot y plataforma de trading de meme coins';

  @override
  String get btnWatchYoutube => 'Ver en YouTube';

  @override
  String get tabVideo => 'Video';
}
