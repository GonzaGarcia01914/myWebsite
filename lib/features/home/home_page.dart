import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final resumeKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    nav.register('hero', heroKey);
    nav.register('projects', projectsKey);
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
/// ---------- HERO (solo título + descripción) ----------
class _HeroNav extends StatelessWidget {
  const _HeroNav({super.key, required this.onSelect});
  final void Function(String id)
  onSelect; // lo mantenemos por si más adelante lo usas

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final topSafe = MediaQuery.paddingOf(context).top + kToolbarHeight;

    return Container(
      padding: EdgeInsets.fromLTRB(16, topSafe + 24, 16, 48),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Column(
          children: [
            Text(
              'Gonzalo García — Portfolio',
              textAlign: TextAlign.center,
              style: t.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Desarrollador Flutter/Dart con 4 años de experiencia. '
              'Creo experiencias multiplataforma enfocadas en rendimiento, accesibilidad y UX, '
              'integrando Cloud (Azure/GCP) y GenAI cuando aporta valor.',
              textAlign: TextAlign.center,
              style: t.titleMedium,
            ),
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
          return GridView.builder(
            itemCount: projects.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              childAspectRatio: 1.18,
              crossAxisSpacing: 24, // espacio horizontal
              mainAxisSpacing: 24, //  espacio vertical
            ),
            itemBuilder: (_, i) => ProjectCard(project: projects[i]),
          );
        },
      ),
    );
  }
}

/// ---------- RESUME (con Experiencia integrada) ----------
class _ResumeSection extends StatelessWidget {
  const _ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    final bullets = const [
      'Flutter/Dart (4 años), Java (2), C#',
      'Azure/GCP, Firebase, REST APIs',
      'GenAI, CI/CD, Testing, Accesibilidad',
      'ES nativo · EN C1',
    ];

    final exp = const [
      (
        'Cognizant (Google Cloud)',
        'Generative AI — SME · Flutter',
        '08/2024 to 04/2025',
      ),
      (
        'Microsoft / LTIM',
        'Azure App Services · Plataforma',
        '10/2023 to 08/2024',
      ),
      ('La Plata', 'Flutter/Dart Developer', '03/2020 to 06/2023'),
    ];

    return _Section(
      id: 'Resume',
      child: Column(
        children: [
          // Skills
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: bullets
                .map(
                  (b) => Chip(
                    label: Text(b, style: t.labelLarge),
                    side: BorderSide(
                      color: scheme.outlineVariant.withValues(alpha: .45),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 36),

          // Subtítulo Experiencia
          Text(
            'Experiencia',
            style: t.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),

          // Cards de experiencia
          Column(
            children: exp
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      color: scheme.surface.withValues(alpha: 0.10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 22,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Text(e.$1, style: t.titleLarge)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.$2, style: t.titleMedium),
                                  const SizedBox(height: 6),
                                  Text(e.$3, style: t.bodyLarge),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
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
        children: const [
          _ContactCard(
            title: 'Email',
            subtitle: 'gonzalogarcia01914@gmail.com',
            icon: Icons.email,
            url: 'mailto:gonzalogarcia01914@gmail.com',
          ),
          _ContactCard(
            title: 'Instagram',
            subtitle: '@gonzagarcia019',
            icon: Icons.camera_alt_outlined,
            url: 'https://instagram.com/gonzagarcia019',
          ),
          _ContactCard(
            title: 'Teléfono',
            subtitle: '+48 519 116 988',
            icon: Icons.phone,
            url: 'tel:+48519116988',
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  const _ContactCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.url,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String url;

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hover = false;
  bool _focused = false;

  Future<void> _open() async {
    final uri = Uri.parse(widget.url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank', // nueva pestaña en web
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    final borderColor = _hover || _focused
        ? scheme.primary.withValues(alpha: 0.45)
        : scheme.outlineVariant.withValues(alpha: 0.35);

    return FocusableActionDetector(
      onShowFocusHighlight: (v) => setState(() => _focused = v),
      mouseCursor: SystemMouseCursors.click,
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<Intent>(
          onInvoke: (_) {
            _open();
            return null;
          },
        ),
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          transform: Matrix4.identity()..translate(0.0, _hover ? -2.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
            boxShadow: _hover
                ? [
                    BoxShadow(
                      color: scheme.primary.withValues(alpha: 0.18),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : const [],
          ),
          child: Material(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: _open,
              child: SizedBox(
                width: 280,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(widget.icon),
                      const SizedBox(height: 12),
                      Text(widget.title, style: t.titleLarge),
                      const SizedBox(height: 4),
                      Text(widget.subtitle, style: t.bodyMedium),
                      const SizedBox(height: 12),
                      const Text(
                        'Toca para abrir',
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              id,
              textAlign: TextAlign.center,
              style: t.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 24),
            child,
          ],
        ),
      ),
    );
  }
}
