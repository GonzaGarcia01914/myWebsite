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
    playUrl: 'https://play.google.com/store/apps/details?id=<PAQUETE>',
    tags: [
      'Flutter',
      'Riverpod',
      'GoRouter',
      'Firebase Functions',
      'RESTful API',
    ],
    summary: '''
Flutter Movies Portfolio is a mobile application built with Flutter, designed to showcase my expertise in cross-platform development and external service integration. 

The app allows users to explore movies and TV shows (now playing, popular, search, details, cast, and recommendations) by consuming the The Movie Database (TMDb) API through a custom Firebase backend that secures API keys and acts as a safe proxy.

This project is part of my professional portfolio, aimed at demonstrating best practices in architecture, state management, REST API consumption, Firebase integration, and production deployment.
''',
  ),

  Project(
    title: 'Tu proyecto #2',
    subtitle: 'Descripción corta',
    demoUrl: null, // si no tienes demo web
    githubUrl: 'https://github.com/<TU-USER>/<repo-2>', // TODO
    codeEmbedUrl: null,
    playUrl: null,
    tags: ['Flutter'],
  ),

  Project(
    title: 'This page was also made with Flutter!',
    subtitle: 'El propio portfolio construido con Flutter Web',
    showDemo: false, // ⟵ oculta pestaña Demo
    demoUrl: null,
    githubUrl:
        'https://github.com/GonzaGarcia01914/myWebsite.git', // ajusta si cambia
    // Recomendado: usar el code.html local de ESTE repo (copiado a /web)
    codeEmbedUrl:
        '/code.html?owner=GonzaGarcia01914&repo=myWebsite&branch=main',
    tags: ['Flutter', 'Riverpod', 'GoRouter'],
    summary:
        'SPA con navegación por secciones, efectos hover, modal de proyectos con demo y visor de código.',
  ),
];
