import '../../../core/models/project.dart';

final projects = <Project>[
  Project(
    id: 'movies',
    title: 'Flutter Movies Portfolio',
    subtitle:
        'Explorador TMDb + favoritos + cache; backend proxy en Firebase Functions',
    repoUrl: 'https://github.com/<tu-user>/<repo-movies>',
    webDemoUrl: 'https://<tu-user>.github.io/<repo-movies>/', // si publicas web
    playUrl: 'https://play.google.com/store/apps/details?id=<paquete>',
    tags: ['Flutter', 'Riverpod', 'GoRouter', 'Firebase Functions', 'TMDb'],
    summary:
        'App de catálogo de películas con búsqueda, detalles y favoritos, '
        'respetando cuotas y seguridad de API mediante proxy server-side.',
  ),
  Project(
    id: 'x2',
    title: 'Tu proyecto #2',
    subtitle: 'Descripción corta',
    repoUrl: 'https://github.com/<tu-user>/<repo-2>',
    webDemoUrl: null,
    playUrl: null,
    tags: ['Flutter'],
    summary: 'Breve resumen del objetivo y el reto técnico principal.',
  ),
];
