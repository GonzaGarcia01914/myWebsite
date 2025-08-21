import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_Exp>[
      _Exp(
        company: 'Cognizant (Google Cloud)',
        period: '08/2024 – 04/2025',
        role: 'Generative AI — SME · Flutter',
        bullets: const [
          'Desarrollo de apps Flutter integradas con soluciones de IA de Google Cloud.',
          'Enfoque en UX, rendimiento y trazabilidad end‑to‑end.',
        ],
      ),
      _Exp(
        company: 'Microsoft / LTIM',
        period: '10/2023 – 08/2024',
        role: 'Azure App Services · Soporte plataforma',
        bullets: const [
          'Diagnóstico y resolución de issues de plataforma (networking, certificados).',
          'Mejora de fiabilidad y tiempos de respuesta.',
        ],
      ),
      _Exp(
        company: 'La Plata',
        period: '03/2020 – 06/2023',
        role: 'Flutter/Dart Developer',
        bullets: const [
          'Desarrollo de aplicaciones multiplataforma con Flutter/Dart.',
          'Integración de servicios y buenas prácticas de arquitectura.',
        ],
      ),
    ];

    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Experiencia')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (_, i) {
              final e = items[i];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.company, style: t.titleLarge),
                      const SizedBox(height: 4),
                      Text('${e.role} — ${e.period}', style: t.bodyMedium),
                      const SizedBox(height: 12),
                      ...e.bullets.map(
                        (b) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('•  '),
                              Expanded(child: Text(b)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: items.length,
          ),
        ),
      ),
    );
  }
}

class _Exp {
  final String company;
  final String role;
  final String period;
  final List<String> bullets;
  _Exp({
    required this.company,
    required this.role,
    required this.period,
    required this.bullets,
  });
}
