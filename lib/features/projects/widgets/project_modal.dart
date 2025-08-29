import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/models/project.dart';
import '../../../core/widgets/web_demo_view.dart'; // IFrame helper
import '../../../core/widgets/phone_frame.dart';

class ProjectModal extends StatefulWidget {
  const ProjectModal({super.key, required this.project});
  final Project project;

  @override
  State<ProjectModal> createState() => _ProjectModalState();
}

class _ProjectModalState extends State<ProjectModal>
    with TickerProviderStateMixin {
  late final TabController _tabs;

  @override
  void initState() {
    super.initState();

    // Construimos el número de pestañas dinámicamente:
    // Demo (si procede) + Code + Descripción
    final hasDemo =
        widget.project.showDemo && (widget.project.demoUrl ?? '').isNotEmpty;
    final length = (hasDemo ? 1 : 0) + 2; // +2 por Code y Descripción
    _tabs = TabController(length: length, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  }

  /// Si tenemos githubUrl (https://github.com/<owner>/<repo>),
  /// devolvemos https://<owner>.github.io/<repo>/code.html?owner=<owner>&repo=<repo>&branch=main
  String? _inferCodeViewerFromGithub(String? githubUrl) {
    if (githubUrl == null) return null;
    try {
      final uri = Uri.parse(githubUrl);
      final parts = uri.path
          .split('/')
          .where((s) => s.isNotEmpty)
          .toList(); // [owner, repo]
      if (parts.length < 2) return null;
      final owner = parts[0];
      final repo = parts[1];
      final base = 'https://$owner.github.io/$repo/code.html';
      return '$base?owner=$owner&repo=$repo&branch=main';
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final inset = EdgeInsets.symmetric(
      horizontal: size.width < 600 ? 12 : 24,
      vertical: size.height < 700 ? 12 : 24,
    );

    final hasDemo =
        widget.project.showDemo && (widget.project.demoUrl ?? '').isNotEmpty;

    // ---------- Armamos tabs y vistas ----------
    final tabs = <Tab>[];
    final views = <Widget>[];

    if (hasDemo) {
      tabs.add(const Tab(text: 'Demo'));
      views.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Builder(
            builder: (context) {
              final emulateMobile = widget.project.emulateMobileDemo;
              final emulateTablet = widget.project.emulateTabletDemo;
              final demo = WebDemoView(url: widget.project.demoUrl!);
              Widget content;
              if (!emulateMobile && !emulateTablet) {
                content = Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: demo,
                  ),
                );
              } else if (emulateTablet) {
                // Tablet en horizontal
                content = Center(
                  child: PhoneFrame(
                    maxWidth: 1024,
                    aspect: 3 / 4, // landscape tablet (height/width)
                    bezel: 14,
                    cornerRadius: 32,
                    screenRadius: 24,
                    child: Transform.scale(
                      scale: 0.9, // ligero zoom-out para encajar mejor
                      alignment: Alignment.center,
                      child: demo,
                    ),
                  ),
                );
              } else {
                // Móvil alto
                content = Center(
                  child: PhoneFrame(
                    maxWidth: 420,
                    aspect: 19.5 / 9.0,
                    bezel: 12,
                    child: Transform.scale(
                      scale: 0.95,
                      alignment: Alignment.center,
                      child: demo,
                    ),
                  ),
                );
              }

              // Warning banner above demo
              final banner = Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: scheme.secondary.withValues(alpha: .08),
                  border: Border.all(
                    color: scheme.outlineVariant.withValues(alpha: .35),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Keep in mind that this project was designed for mobile devices; this is a representative web demo.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              );

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [banner, const SizedBox(height: 10), content],
              );
            },
          ),
        ),
      );
    }

    // CODE
    tabs.add(const Tab(text: 'Code'));
    views.add(
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Builder(
          builder: (_) {
            final url =
                widget.project.codeEmbedUrl ??
                _inferCodeViewerFromGithub(widget.project.githubUrl);

            if (url == null) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('No hay visor de código configurado.'),
                    const SizedBox(height: 12),
                    if (widget.project.githubUrl != null)
                      FilledButton.icon(
                        onPressed: () => _openUrl(widget.project.githubUrl!),
                        icon: const Icon(Icons.code),
                        label: const Text('Abrir en GitHub'),
                      ),
                  ],
                ),
              );
            }

            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: SizedBox(
                height: (MediaQuery.of(context).size.height * 0.55)
                    .clamp(420, 680)
                    .toDouble(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: WebDemoView(url: url),
                ),
              ),
            );
          },
        ),
      ),
    );

    // DESCRIPCIÓN
    tabs.add(const Tab(text: 'Descripción'));
    views.add(
      SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.project.tags
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: scheme.outlineVariant.withValues(alpha: .65),
                        ),
                        color: scheme.surface.withValues(alpha: .10),
                      ),
                      child: Text(tag, style: t.labelLarge),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 14),
            if ((widget.project.summary ?? '').isNotEmpty)
              Text(widget.project.summary!, style: t.bodyLarge),
          ],
        ),
      ),
    );

    return Dialog(
      backgroundColor: scheme.surface.withValues(alpha: .95),
      insetPadding: inset,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 1100,
              minHeight: (size.height * 0.85).clamp(420, 520),
              maxHeight: (size.height * 0.95).clamp(520, 720),
            ),
            child: Column(
              children: [
                // ---------- Header ----------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 12, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(widget.project.title, style: t.titleLarge),
                      ),
                      if (widget.project.playUrl != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilledButton.icon(
                            onPressed: () => _openUrl(widget.project.playUrl!),
                            icon: const Icon(Icons.shop_2),
                            label: const Text('Google Play'),
                          ),
                        ),
                      if (widget.project.githubUrl != null)
                        OutlinedButton.icon(
                          onPressed: () => _openUrl(widget.project.githubUrl!),
                          icon: const Icon(Icons.code),
                          label: const Text('Check it on GitHub!'),
                        ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'Cerrar',
                      ),
                    ],
                  ),
                ),

                // ---------- Tabs ----------
                TabBar(
                  controller: _tabs,
                  labelStyle: t.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: t.titleMedium,
                  dividerColor: scheme.outlineVariant.withValues(alpha: .5),
                  indicatorColor: scheme.primary,
                  tabs: tabs,
                ),

                // ---------- Body ----------
                Expanded(
                  child: TabBarView(controller: _tabs, children: views),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
