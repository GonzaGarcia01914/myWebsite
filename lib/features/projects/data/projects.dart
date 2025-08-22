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
    summary: 'App de catálogo de películas con búsqueda, detalles y favoritos…',
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
    demoUrl:
        'https://github.com/GonzaGarcia01914/myWebsite.git', // TODO (si publicas)
    githubUrl: 'https://github.com/GonzaGarcia01914/myWebsite.git', // TODO
    codeEmbedUrl: null,
    playUrl: null,
    tags: ['Flutter', 'Riverpod', 'GoRouter'],
  ),
];
