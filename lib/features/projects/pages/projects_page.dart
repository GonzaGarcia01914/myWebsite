import 'package:flutter/material.dart';
import '../data/projects.dart';
import '../../../l10n/app_localizations.dart';
import '../widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key}); // <= constructor const y sin params

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Proyectos')),
      body: LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth;
          final cols = w >= 1200
              ? 3
              : w >= 900
              ? 2
              : 1;
          final t = AppLocalizations.of(context)!;
          final list = localizedProjects(t);
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: GridView.count(
                crossAxisCount: cols,
                childAspectRatio: 1.2,
                padding: const EdgeInsets.all(16),
                children: list.map((p) => ProjectCard(project: p)).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
