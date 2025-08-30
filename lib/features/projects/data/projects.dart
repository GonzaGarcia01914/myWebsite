import '../../../core/models/project.dart';

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
    demoUrl:
        'https://gonzagarcia01914.github.io/mestura-cooking-app/', // si no tienes demo web
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
    showDemo: false, // ⟵ oculta pestaña Demo
    demoUrl: null,
    githubUrl:
        'https://github.com/GonzaGarcia01914/myWebsite.git', // ajusta si cambia
    // Recomendado: usar el code.html local de ESTE repo (copiado a /web)
    codeEmbedUrl:
        '/code.html?owner=GonzaGarcia01914&repo=myWebsite&branch=main',
    id: 'portfolio',
    tags: ['FlutterWeb', 'Riverpod', 'GoRouter', 'ResponsiveDesign', "Github"],
    summary:
        'Portafolio web (Flutter Web) con navegación por secciones y modal de proyectos. Cada proyecto incluye demo embebida (con marco de móvil/tablet), visor de código conectado a GitHub y descripción con tags. UI animada con Material 3, diseño responsive y soporte de foco/teclado. Implementado con Riverpod + GoRouter y publicado en GitHub Pages, priorizando rendimiento, accesibilidad y una experiencia limpia y moderna.',
  ),
];
