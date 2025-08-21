import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Resume')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text('Resumen', style: t.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Desarrollador Flutter/Dart (4 años) y Cloud Engineer. Experiencia en apps multiplataforma, '
                'Azure/GCP, integración de GenAI y buenas prácticas de arquitectura/UX.',
                style: t.bodyLarge,
              ),
              const SizedBox(height: 24),

              Text('Skills', style: t.headlineSmall),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  _Chip('Flutter'),
                  _Chip('Dart'),
                  _Chip('Riverpod'),
                  _Chip('GoRouter'),
                  _Chip('REST'),
                  _Chip('Firebase'),
                  _Chip('Azure'),
                  _Chip('GCP'),
                  _Chip('GenAI'),
                  _Chip('C#'),
                  _Chip('Java'),
                  _Chip('CI/CD'),
                  _Chip('Testing'),
                ],
              ),
              const SizedBox(height: 24),

              Text('Educación', style: t.headlineSmall),
              const SizedBox(height: 12),
              _Edu(
                title: 'Computer Engineering — 3er año',
                subtitle:
                    'Especialización en Redes Neuronales y Machine Learning',
              ),
              _Edu(
                title: 'Applications Design & Programming',
                subtitle: 'Asunción Polytechnic University',
              ),
              const SizedBox(height: 24),

              Text('Idiomas', style: t.headlineSmall),
              const SizedBox(height: 8),
              const Text('Español (nativo) · Inglés (C1)'),

              const SizedBox(height: 28),
              Align(
                alignment: Alignment.centerLeft,
                child: FilledButton.icon(
                  onPressed: () =>
                      _openAssetPdf('assets/cv/GonzaloGarciaCV_06-2.pdf'),
                  icon: const Icon(Icons.download),
                  label: const Text('Descargar CV (PDF)'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openAssetPdf(String assetPath) async {
    // En Flutter Web los assets se sirven bajo la misma ruta:
    final uri = Uri.parse(assetPath);
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Chip(label: Text(text));
}

class _Edu extends StatelessWidget {
  const _Edu({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: t.titleMedium),
          Text(subtitle, style: t.bodyMedium),
        ],
      ),
    );
  }
}
