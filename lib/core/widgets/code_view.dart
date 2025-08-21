import 'package:flutter/material.dart';

class CodeView extends StatelessWidget {
  const CodeView({super.key, required this.repoUrl, required this.path});
  final String repoUrl;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SelectableText(
        'Vista de código: carga $path desde $repoUrl (raw). '
        'Si hay CORS, servimos via Cloud Function proxy. '
        'Luego aplicamos highlight para sintaxis.',
      ),
    );
  }
}
