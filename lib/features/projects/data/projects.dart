import '../../../core/models/project.dart';

final projects = <Project>[
  Project(
    title: 'Flutter Movies Portfolio',
    subtitle:
        'Explorador TMDb + favoritos + caché; backend proxy en Firebase Functions',
    // 👉 Demo web embebible (tu build web o un sandbox)
    demoUrl:
        'https://github.com/GonzaGarcia01914/movies.git', // TODO: pon tu URL real o null
    // 👉 Repo GitHub para el botón superior y la pestaña "Código"
    githubUrl: 'https://github.com/GonzaGarcia01914/movies.git', // TODO
    // 👉 Opcional: visor de código embebible (DartPad/Gist/Pages)
    codeEmbedUrl:
        null, // ej: https://dartpad.dev/embed-flutter.html?id=<GIST_ID>
    // 👉 Botón Google Play (si existe)
    playUrl:
        'https://play.google.com/store/apps/details?id=<PAQUETE>', //TODO o null
    tags: ['Flutter', 'Riverpod', 'GoRouter', 'Firebase Functions', 'TMDb'],
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
        'https://<TU-USER>.github.io/<repo-portfolio>/', // TODO (si publicas)
    githubUrl: 'https://github.com/<TU-USER>/<repo-portfolio>', // TODO
    codeEmbedUrl: null,
    playUrl: null,
    tags: ['Flutter', 'Riverpod', 'GoRouter'],
  ),
];
