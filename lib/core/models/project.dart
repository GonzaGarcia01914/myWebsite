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
  });
}
