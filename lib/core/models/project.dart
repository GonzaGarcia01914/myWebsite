import 'package:flutter/foundation.dart';

@immutable
class Project {
  final String title;
  final String subtitle;
  final List<String> tags;

  final String? demoUrl; // URL demo web (si procede)
  final String? videoUrl; // URL video demo (si procede)
  final String? videoPosterUrl; // Poster opcional para video
  final String? youtubeUrl; // Link de YouTube (opcional)
  final String? logoAsset; // Asset del logo (opcional)
  final String? githubUrl; // repo
  final String? codeEmbedUrl; // visor embebible (code.html / DartPad)
  final String? playUrl; // Google Play (opcional)

  final String? id;
  final String? summary;

  /// Si es false, no se muestra la pestaña Demo (util para esta misma web).
  final bool showDemo;
  /// Si es false, no se muestra la pestaña Code (util para proyectos sin codigo publico).
  final bool showCode;
  /// Si es false, no se muestra el boton de GitHub.
  final bool showGithub;
  /// Si es true, la pestaña Demo se renderiza dentro de un marco tipo movil.
  final bool emulateMobileDemo;
  /// Si es true, la pestaña Demo se renderiza dentro de un marco tipo tablet en horizontal.
  final bool emulateTabletDemo;

  const Project({
    required this.title,
    required this.subtitle,
    required this.tags,
    this.demoUrl,
    this.videoUrl,
    this.videoPosterUrl,
    this.youtubeUrl,
    this.logoAsset,
    this.githubUrl,
    this.codeEmbedUrl,
    this.playUrl,
    this.id,
    this.summary,
    this.showDemo = true, // por defecto mostramos demo
    this.showCode = true,
    this.showGithub = true,
    this.emulateMobileDemo = false,
    this.emulateTabletDemo = false,
  });
}
