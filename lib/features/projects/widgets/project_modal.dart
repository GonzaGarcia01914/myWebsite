import 'package:flutter/material.dart';
import '../../../core/models/project.dart';
import '../../../core/utils/open_url.dart';
import '../../../core/widgets/web_demo_view.dart';
import '../../../core/widgets/code_view.dart';

class ProjectModal extends StatefulWidget {
  const ProjectModal({super.key, required this.project});
  final Project project;

  @override
  State<ProjectModal> createState() => _ProjectModalState();
}

class _ProjectModalState extends State<ProjectModal>
    with TickerProviderStateMixin {
  late final tab = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100, maxHeight: 720),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      p.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  if (p.playUrl != null)
                    FilledButton.icon(
                      onPressed: () => openUrl(p.playUrl!),
                      icon: const Icon(Icons.shop),
                      label: const Text('Google Play'),
                    ),
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () => openUrl(p.repoUrl),
                    icon: const Icon(Icons.code),
                    label: const Text('Código'),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            TabBar(
              controller: tab,
              tabs: const [
                Tab(text: 'Demo'),
                Tab(text: 'Código'),
                Tab(text: 'Store'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tab,
                children: [
                  WebDemoView(url: p.webDemoUrl),
                  CodeView(repoUrl: p.repoUrl, path: 'lib/main.dart'),
                  Center(
                    child: p.playUrl == null
                        ? const Text('Sin enlace a la tienda.')
                        : FilledButton(
                            onPressed: () => openUrl(p.playUrl!),
                            child: const Text('Abrir en Google Play'),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
