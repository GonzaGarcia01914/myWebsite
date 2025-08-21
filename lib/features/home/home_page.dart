import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../core/utils/scroll_nav.dart';
import '../../core/widgets/app_shell.dart';
import '../../features/projects/data/projects.dart';
import '../../features/projects/widgets/project_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.initialAnchor});
  final String? initialAnchor; // ej: 'projects'

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final nav = SectionNavController();

  final heroKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final resumeKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    nav.register('hero', heroKey);
    nav.register('projects', projectsKey);
    nav.register('experience', experienceKey);
    nav.register('resume', resumeKey);
    nav.register('contact', contactKey);

    // Scroll inicial si vino con /#anchor
    if (widget.initialAnchor != null) {
      // espera 1 frame para que el árbol esté montado
      SchedulerBinding.instance.addPostFrameCallback((_) {
        nav.scrollTo(context, widget.initialAnchor!);
      });
    }
  }

  @override
  void dispose() {
    nav.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      nav: nav,
      body: Scrollbar(
        controller: nav.scrollController,
        child: SingleChildScrollView(
          controller: nav.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeroNav(
                key: heroKey,
                onSelect: (id) => nav.scrollTo(context, id),
              ),
              _ProjectsSection(key: projectsKey),
              _ExperienceSection(key: experienceKey),
              _ResumeSection(key: resumeKey),
              _ContactSection(key: contactKey),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------- HERO (enlaces grandes) ----------
class _HeroNav extends StatelessWidget {
  const _HeroNav({super.key, required this.onSelect});
  final void Function(String id) onSelect;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          children: [
            Text(
              'Gonzalo García — Portfolio',
              style: t.displaySmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 18),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                _HeroButton(
                  label: 'Proyectos',
                  icon: Icons.apps,
                  onTap: () => onSelect('projects'),
                ),
                _HeroButton(
                  label: 'Experiencia',
                  icon: Icons.work_outline,
                  onTap: () => onSelect('experience'),
                ),
                _HeroButton(
                  label: 'Resume',
                  icon: Icons.description_outlined,
                  onTap: () => onSelect('resume'),
                ),
                _HeroButton(
                  label: 'Contacto',
                  icon: Icons.mail_outline,
                  onTap: () => onSelect('contact'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroButton extends StatelessWidget {
  const _HeroButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              scheme.primary.withValues(alpha: 0.14),
              scheme.secondary.withValues(alpha: 0.10),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: scheme.outlineVariant.withValues(alpha: 0.35),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30),
            const SizedBox(width: 12),
            Text(label, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}

/// ---------- PROYECTOS ----------
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return _Section(
      id: 'Proyectos',
      child: LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth;
          final cols = w >= 1200
              ? 3
              : w >= 900
              ? 2
              : 1;
          return GridView.count(
            crossAxisCount: cols,
            childAspectRatio: 1.2,
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: projects.map((p) => ProjectCard(project: p)).toList(),
          );
        },
      ),
    );
  }
}

/// ---------- EXPERIENCIA ----------
class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection({super.key});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final items = const [
      (
        'Cognizant (Google Cloud)',
        '08/2024 – 04/2025',
        'Generative AI — SME · Flutter',
      ),
      (
        'Microsoft / LTIM',
        '10/2023 – 08/2024',
        'Azure App Services · Plataforma',
      ),
      ('La Plata', '03/2020 – 06/2023', 'Flutter/Dart Developer'),
    ];
    return _Section(
      id: 'Experiencia',
      child: Column(
        children: items.map((e) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(e.$1, style: t.titleLarge)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.$3, style: t.bodyLarge),
                        const SizedBox(height: 6),
                        Text(e.$2, style: t.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// ---------- RESUME ----------
class _ResumeSection extends StatelessWidget {
  const _ResumeSection({super.key});
  @override
  Widget build(BuildContext context) {
    final bullets = const [
      'Flutter/Dart (4 años), Java (2), C#',
      'Azure/GCP, Firebase, REST APIs',
      'GenAI, CI/CD, Testing, Accesibilidad',
      'ES nativo · EN C1',
    ];
    return _Section(
      id: 'Resume',
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: bullets.map((b) => Chip(label: Text(b))).toList(),
      ),
    );
  }
}

/// ---------- CONTACTO ----------
class _ContactSection extends StatelessWidget {
  const _ContactSection({super.key});
  @override
  Widget build(BuildContext context) {
    return _Section(
      id: 'Contacto',
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          _ContactTile(
            title: 'Email',
            subtitle: 'gonzalogarcia01914@gmail.com',
            icon: Icons.email,
          ),
          _ContactTile(
            title: 'Instagram',
            subtitle: '@gonzagarcia019',
            icon: Icons.camera_alt_outlined,
          ),
          _ContactTile(
            title: 'Teléfono',
            subtitle: '+48 519 116 988',
            icon: Icons.phone,
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title, subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SizedBox(
      width: 280,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              const SizedBox(height: 10),
              Text(title, style: t.titleLarge),
              Text(subtitle, style: t.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------- CONTENEDOR DE SECCIÓN ----------
class _Section extends StatelessWidget {
  const _Section({required this.id, required this.child});
  final String id;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              id,
              style: t.displaySmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 18),
            child,
          ],
        ),
      ),
    );
  }
}
