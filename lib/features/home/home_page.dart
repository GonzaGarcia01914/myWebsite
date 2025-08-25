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

/// ---------- HERO (solo título + descripción) ----------
class _HeroNav extends StatelessWidget {
  const _HeroNav({super.key, required this.onSelect});
  final void Function(String id) onSelect;

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
class _ResumeSection extends StatefulWidget {
  const _ResumeSection({super.key});

  @override
  State<_ResumeSection> createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<_ResumeSection> {
  int? _expanded;

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    // SKILLS
    final skills = const [
      'Flutter/Dart',
      'Java',
      'C#',
      'Azure',
      'Firebase',
      'REST APIs',
      'GenAI integration',
      'Riverpod/Provider',
      'Native Spanish',
      'English C1',
    ];

    // EXPERIENCE + descripción
    final exp = [
      (
        title: 'Cognizant (Google Cloud)',
        role: 'Generative AI — SME · Flutter',
        period: '08/2024 to 04/2025',
        desc:
            'My most recen project was as a Generative AI Subject Matter Expert (SME) at Cognizant, within the Google Cloud project. '
            'My role involved developing applications using Flutter and integrating Google Cloud’s AI solutions to deliver innovative experiences for our clients.',
      ),
      (
        title: 'Microsoft / LTIM',
        role: 'Azure App Services · Plataforma',
        period: '10/2023 to 08/2024',
        desc:
            'I worked as part of Microsoft Azure App Services team, in the diagnosis and resolution of platform and software issues, '
            'mainly related with Networking and Certificates.',
      ),
      (
        title: 'La Plata',
        role: 'Flutter/Dart Developer',
        period: '03/2020 to 06/2023',
        desc:
            'I worked on the development of multi platform applications mainly with flutter-dart.',
      ),
    ];

    // Chip con leve glow / gradiente (igual que antes)
    Widget buildSkillChip(String text) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: scheme.outlineVariant.withValues(alpha: .5),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              scheme.primary.withValues(alpha: .09),
              scheme.secondary.withValues(alpha: .08),
              scheme.surface.withValues(alpha: .05),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: scheme.primary.withValues(alpha: .12),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(text, style: t.labelLarge),
        ),
      );
    }

    // Card de experiencia con LA MISMA animación/efecto que ProjectCard
    Widget buildExpItem(int index) {
      final item = exp[index];
      final isOpen = _expanded == index;

      final baseBorder = Theme.of(
        context,
      ).colorScheme.outlineVariant.withValues(alpha: 0.35);
      final hoverBorder = Theme.of(
        context,
      ).colorScheme.primary.withValues(alpha: 0.45);

      return _HoverCard(
        borderRadius: 16,

        borderColor: baseBorder,
        hoverBorderColor: hoverBorder,
        onTap: () => setState(() => _expanded = isOpen ? null : index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: scheme.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(item.title, style: t.titleLarge)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.role, style: t.titleMedium),
                          const SizedBox(height: 6),
                          Text(item.period, style: t.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(item.desc, style: t.bodyLarge),
                  ),
                  crossFadeState: isOpen
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 180),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return _Section(
      id: 'Resume',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // My skills
          Text(
            'My skills',
            style: t.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: skills.map(buildSkillChip).toList(),
          ),
          const SizedBox(height: 36),

          // Experience
          Text(
            'Experience',
            style: t.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(
              exp.length,
              (i) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: buildExpItem(i),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Descargar CV
          OutlinedButton.icon(
            onPressed: () => _openUrl('assets/GonzaloGarciaCV_06-2.pdf'),
            icon: const Icon(Icons.file_download),
            label: const Text('Download CV (PDF)'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}

/// Contenedor con la MISMA animación usada en ProjectCard
/// Contenedor con la MISMA animación/efecto que ProjectCard:
/// - translateY -2 en hover
/// - sombra primary a 0.18, blur 20, offset (0, 8)
/// - cambio de color de borde en hover
class _HoverCard extends StatefulWidget {
  const _HoverCard({
    required this.child,
    this.onTap,
    this.borderRadius = 16,
    this.borderColor,
    this.hoverBorderColor,
  });

  final Widget child;
  final VoidCallback? onTap;
  final double borderRadius;

  /// Si se pasan, se dibuja el borde igual que en ProjectCard (cambia en hover).
  final Color? borderColor;
  final Color? hoverBorderColor;

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final Color? borderColor = widget.borderColor;
    final Color? hoverBorder = widget.hoverBorderColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..translate(0.0, _hover ? -2.0 : 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: (borderColor != null && hoverBorder != null)
              ? Border.all(color: _hover ? hoverBorder : borderColor)
              : null,
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
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            onTap: widget.onTap,
            child: widget.child,
          ),
        ),
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
          _ContactCard(
            title: 'LinkedIn',
            subtitle: 'My LinkedIn profile',
            icon: Icons.work,
            url: 'https://www.linkedin.com/in/gonzalogarciacv/?locale=en_US',
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
