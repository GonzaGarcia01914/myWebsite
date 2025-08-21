import 'package:flutter/foundation.dart';

@immutable
class Project {
  // Básico
  final String title;
  final String subtitle;
  final List<String> tags;

  // Enlaces / embeds
  final String? demoUrl; // build web o sandbox embebible
  final String? githubUrl; // repo (link directo)
  final String? codeEmbedUrl; // visor embebible (DartPad/Gist/Pages/etc.)
  final String? playUrl; // botón Google Play (opcional)

  // Opcionales útiles (por si los quieres usar en el futuro)
  final String? id;
  final String? summary;

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
  });
}
