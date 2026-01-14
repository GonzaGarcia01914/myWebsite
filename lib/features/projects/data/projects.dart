import '../../../core/models/project.dart';
import '../../../l10n/app_localizations.dart';

final projects = <Project>[
  Project(
    title: 'Flutter Movies Portfolio',
    subtitle:
        'Explorador TMDb + favoritos + caché; backend proxy en Firebase Functions',
    demoUrl: 'https://gonzagarcia01914.github.io/movies/', // ya lo usas
    githubUrl: 'https://github.com/GonzaGarcia01914/movies',
    codeEmbedUrl:
        'https://gonzagarcia01914.github.io/movies/code.html?owner=GonzaGarcia01914&repo=movies&branch=main', // opcional; si no lo pones, se infiere.
    playUrl: null,
    tags: [
      'Flutter',
      'Riverpod',
      'GoRouter',
      'Firebase Functions',
      'RESTful API',
      'GitHub',
    ],
    emulateMobileDemo: false,
    emulateTabletDemo: true,
    summary: '''
Flutter Movies Portfolio is a mobile application built with Flutter, designed to showcase my expertise in cross-platform development and external service integration. 

The app allows users to explore movies and TV shows (now playing, popular, search, details, cast, and recommendations) by consuming the The Movie Database (TMDb) API through a custom Firebase backend that secures API keys and acts as a safe proxy.

This project is part of my professional portfolio, aimed at demonstrating best practices in architecture, state management, REST API consumption, Firebase integration, and production deployment.
''',
  ),

  Project(
    emulateMobileDemo: false,
    emulateTabletDemo: true,
    title: 'Mestura - Your cooking AI assistant',
    subtitle: 'Descripción corta',
    demoUrl: 'https://gonzagarcia01914.github.io/mestura-cooking-app/',
    logoAsset: 'assets/logo_mestura.png', // si no tienes demo web
    githubUrl:
        'https://github.com/GonzaGarcia01914/mestura-cooking-app', // TODO
    codeEmbedUrl:
        'https://gonzagarcia01914.github.io/mestura-cooking-app/code.html?owner=GonzaGarcia01914&repo=mestura-cooking-app&branch=main',
    playUrl: null,
    tags: [
      'Flutter',
      'Riverpod',
      'Firebase',
      'ADmob',
      'RESTful API',
      "GenAI",
      'GitHub',
    ],
    summary: '''
Genera recetas a partir de ingredientes o antojos usando IA, devolviendo un resultado estructurado con título, ingredientes, pasos y, opcionalmente, imagen del plato.
Personaliza cada receta con raciones, tiempo disponible, nivel de habilidad, límites de calorías y preferencias/dietas (vegano, halal, sin gluten, etc.).
Incluye modo “cocinar paso a paso” con temporizadores inteligentes, notificaciones locales y cuenta atrás en segundo plano.
Guarda recetas favoritas y gestiona una lista de la compra sin conexión.
Comparte recetas mediante enlaces profundos; al abrirlos, la app recupera el contenido compartido.
Experiencia multidioma (12 idiomas, incluido español e inglés) y diseño pulido con glassmorphism y animaciones sutiles.
Monetización por anuncios intersticiales mostrados de forma espaciada para no interrumpir la UX.

Tecnologías:

Frontend: Flutter (Dart 3), Material Design, animaciones y efectos “frosted glass”; cached_network_image, google_fonts, flutter_svg.
Estado y navegación: Riverpod, MaterialApp con rutas y navigatorKey global.
IA: OpenAI (GPT‑4o‑mini para recetas y “omni‑moderation‑latest” para seguridad); generación opcional de imágenes con DALL·E 3.
Backend/Infra: Firebase (Cloud Functions v2 en Node.js/JS, región europe‑west1), Firebase Auth anónima, App Check, Cloud Firestore para compartir recetas, Secret Manager para la API key de OpenAI.
Seguridad y robustez: Moderación de inputs/outputs, parseo estricto a JSON, validaciones en cliente y servidor.
Datos locales: shared_preferences para recetas guardadas, preferencias dietarias y lista de la compra.
Notificaciones: flutter_local_notifications + timezone para alarmas exactas de cocina y contador persistente.
Deep links y sharing: app_links + esquema personalizado (mestura://recipe?id=...), share_plus.
Monetización: google_mobile_ads con precarga y reintentos; compuerta de frecuencia para mostrar anuncios cada cierto número de acciones.
Diferenciadores

Recetas realmente “cocinables”: escala de raciones, pasos claros, filtros por tiempo y nivel de habilidad.
Salud y preferencias: compatibilidad con alergias, restricciones médicas y religiosas, y opción de incluir macronutrientes por ración.
UX cuidada: interfaz ligera, fondo animado y componentes reutilizables con un sistema visual consistente.
''',
  ),

  Project(
    emulateMobileDemo: true,
    title: 'This page was also made with Flutter!',
    subtitle: 'El propio portfolio construido con Flutter Web',
    showDemo: false, // oculta pesta?a Demo
    logoAsset: 'assets/mi_web_logo.png',
    demoUrl: null,
    githubUrl:
        'https://github.com/GonzaGarcia01914/myWebsite.git', // ajusta si cambia
    // Recomendado: usar el code.html local de ESTE repo (copiado a /web)
    codeEmbedUrl:
        '/code.html?owner=GonzaGarcia01914&repo=myWebsite&branch=main',
    id: 'portfolio',
    tags: ['FlutterWeb', 'Riverpod', 'GoRouter', 'ResponsiveDesign', "Github"],
    summary:
        'Portafolio web (Flutter Web) con navegacion por secciones y modal de proyectos. Cada proyecto incluye demo embebida (con marco de movil/tablet), visor de codigo conectado a GitHub y descripcion con tags. UI animada con Material 3, diseno responsive y soporte de foco/teclado. Implementado con Riverpod + GoRouter y publicado en GitHub Pages, priorizando rendimiento, accesibilidad y una experiencia limpia y moderna.',
  ),

  Project(
    title: 'PumpIt',
    subtitle: 'Workout and progress tracker.',
    demoUrl: null,
    videoUrl: null,
    videoPosterUrl: null,
    youtubeUrl: 'https://youtu.be/_y4SGuqEjeQ',
    logoAsset: 'assets/pump_it.png',
    githubUrl: 'https://github.com/GonzaGarcia01914/pumpIt',
    codeEmbedUrl: null,
    playUrl: null,
    showDemo: false,
    showCode: false,
    showGithub: false,
    tags: ['Flutter', 'Dart', 'Mobile'],
    summary:
        'Pump It Baby is a Flutter app (desktop/web) that monitors featured memecoins on pump.fun in real time and orchestrates an auto-invest bot. The UI is feature-driven and state is managed with Riverpod: FeaturedCoinNotifier handles discovery/filters/insights, AutoInvestNotifier manages configuration and positions, and AutoInvestExecutor watches state changes to decide and execute swaps. The services layer encapsulates data clients (pump.fun, Solana RPC/WS, Helius Enhanced API), execution providers (Jupiter/PumpPortal), wallet providers (local keypair on desktop, Phantom on web), and analytics/AI (optional OpenAI). The architecture cleanly separates data acquisition, decision logic, and execution, with fast confirmations via WebSocket and an HTTP RPC fallback for resilience.',
  ),
];

/// Returns the list of projects with localized title, subtitle and summary.
List<Project> localizedProjects(AppLocalizations t) => <Project>[
  Project(
    id: 'movies',
    title: 'MoviMe',
    subtitle: t.projectMoviesSubtitle,
    summary: t.summaryMovies,
    demoUrl: 'https://gonzagarcia01914.github.io/movies/',
    githubUrl: 'https://github.com/GonzaGarcia01914/movies',
    codeEmbedUrl:
        'https://gonzagarcia01914.github.io/movies/code.html?owner=GonzaGarcia01914&repo=movies&branch=main',
    playUrl: null,
    tags: [
      'Flutter',
      'Riverpod',
      'GoRouter',
      'Firebase Functions',
      'RESTful API',
      'GitHub',
    ],
    emulateMobileDemo: false,
    emulateTabletDemo: true,
  ),
  Project(
    id: 'mestura',
    title: t.projectMesturaTitle,
    subtitle: t.projectMesturaSubtitle,
    summary: t.summaryMestura,
    emulateMobileDemo: false,
    emulateTabletDemo: true,
    demoUrl: 'https://gonzagarcia01914.github.io/mestura-cooking-app/',
    logoAsset: 'assets/logo_mestura.png',
    githubUrl: 'https://github.com/GonzaGarcia01914/mestura-cooking-app',
    codeEmbedUrl:
        'https://gonzagarcia01914.github.io/mestura-cooking-app/code.html?owner=GonzaGarcia01914&repo=mestura-cooking-app&branch=main',
    playUrl: null,
    tags: [
      'Flutter',
      'Riverpod',
      'Firebase',
      'ADmob',
      'RESTful API',
      'GenAI',
      'GitHub',
    ],
  ),
  Project(
    id: 'portfolio',
    emulateMobileDemo: true,
    title: t.projectPortfolioTitle,
    subtitle: t.projectPortfolioSubtitle,
    summary: t.summaryPortfolio,
    showDemo: false,
    demoUrl: null,
    logoAsset: 'assets/mi_web_logo.png',
    githubUrl: 'https://github.com/GonzaGarcia01914/myWebsite.git',
    codeEmbedUrl:
        '/code.html?owner=GonzaGarcia01914&repo=myWebsite&branch=main',
    tags: ['FlutterWeb', 'Riverpod', 'GoRouter', 'ResponsiveDesign', 'Github'],
  ),

  Project(
    id: 'pumpit',
    title: t.projectPumpItTitle,
    subtitle: t.projectPumpItSubtitle,
    summary: t.summaryPumpIt,
    demoUrl: null,
    videoUrl: null,
    videoPosterUrl: null,
    youtubeUrl: 'https://youtu.be/_y4SGuqEjeQ',
    logoAsset: 'assets/pump_it.png',
    githubUrl: 'https://github.com/GonzaGarcia01914/pumpIt',
    showDemo: false,
    showCode: false,
    showGithub: false,
    playUrl: null,
    tags: ['Flutter', 'Dart', 'Mobile'],
  ),
];
