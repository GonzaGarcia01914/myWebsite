import 'package:flutter/material.dart';
import '../../../core/models/project.dart';
import 'project_modal.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => showDialog(
        context: context,
        barrierColor: Colors.black54,
        builder: (_) => ProjectModal(project: project),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                project.subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Wrap(
                spacing: 8,
                runSpacing: -8,
                children: project.tags
                    .map((t) => Chip(label: Text(t)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
