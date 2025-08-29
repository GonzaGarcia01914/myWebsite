import 'package:flutter/foundation.dart';

@immutable
class Project {
  final String title;
  final String subtitle;
  final List<String> tags;

  final String? demoUrl; // URL demo web (si procede)
  final String? githubUrl; // repo
  final String? codeEmbedUrl; // visor embebible (code.html / DartPad)
  final String? playUrl; // Google Play (opcional)

  final String? id;
  final String? summary;

  /// Si es false, no se muestra la pestaña Demo (útil para esta misma web).
  final bool showDemo;
  /// Si es true, la pestaña Demo se renderiza dentro de un marco tipo móvil.
  final bool emulateMobileDemo;
  /// Si es true, la pestaña Demo se renderiza dentro de un marco tipo tablet en horizontal.
  final bool emulateTabletDemo;

  const Project({
    required this.title,
    required this.subtitle,
    required this.tags,
    this.demoUrl,
    this.githubUrl,
    this.codeEmbedUrl,
    this.playUrl,
    this.id,
    this.summary,
    this.showDemo = true, // por defecto sí mostramos demo
    this.emulateMobileDemo = false,
    this.emulateTabletDemo = false,
  });
}
