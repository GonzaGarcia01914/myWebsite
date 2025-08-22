import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/models/project.dart';
import '../../../core/widgets/web_demo_view.dart'; // tu IFrame helper

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
    _tabs = TabController(length: 2, vsync: this); // Solo Demo y Código
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

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: scheme.surface.withValues(alpha: .95),
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1100,
              minHeight: 520,
              maxHeight: 720,
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
                  tabs: const [
                    Tab(text: 'Demo'),
                    Tab(text: 'Description'),
                  ],
                ),

                // ---------- Body ----------
                Expanded(
                  child: TabBarView(
                    controller: _tabs,
                    children: [
                      // DEMO
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Builder(
                          builder: (_) {
                            final url = widget.project.demoUrl;
                            if (url == null) {
                              return const _EmptyState(
                                text: 'No available demo for this project',
                              );
                            }
                            return Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: WebDemoView(url: url),
                              ),
                            );
                          },
                        ),
                      ),

                      // CÓDIGO
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Builder(
                          builder: (_) {
                            // 1) Intentamos usar codeEmbedUrl si lo definiste en el Project.
                            // 2) Si no, inferimos la URL del code.html a partir de githubUrl (owner/repo).
                            final url =
                                widget.project.codeEmbedUrl ??
                                _inferCodeViewerFromGithub(
                                  widget.project.githubUrl,
                                );

                            if (url == null) {
                              return Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'No hay visor de código configurado.',
                                    ),
                                    const SizedBox(height: 12),
                                    if (widget.project.githubUrl != null)
                                      FilledButton.icon(
                                        onPressed: () =>
                                            _openUrl(widget.project.githubUrl!),
                                        icon: const Icon(Icons.code),
                                        label: const Text('Abrir en GitHub'),
                                      ),
                                  ],
                                ),
                              );
                            }

                            final t = Theme.of(context).textTheme;
                            final scheme = Theme.of(context).colorScheme;

                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Visor (iframe) de code.html
                                  Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: SizedBox(
                                      height: 520, // alto del visor
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: WebDemoView(url: url),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Divider(
                                    color: scheme.outlineVariant.withValues(
                                      alpha: .5,
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Chips/Tags
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: widget.project.tags
                                        .map(
                                          (tag) => Chip(
                                            label: Text(tag),
                                            side: BorderSide(
                                              color: scheme.outlineVariant
                                                  .withValues(alpha: .55),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),

                                  const SizedBox(height: 14),

                                  // Descripción (summary)
                                  if ((widget.project.summary ?? '').isNotEmpty)
                                    Text(
                                      widget.project.summary!,
                                      style: t.bodyLarge,
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
