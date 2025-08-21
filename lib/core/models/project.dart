class Project {
  final String id;
  final String title;
  final String subtitle;
  final String repoUrl;
  final String? webDemoUrl;   // demo web embebida
  final String? playUrl;      // Google Play
  final List<String> tags;
  final String summary;
  const Project({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.repoUrl,
    this.webDemoUrl,
    this.playUrl,
    required this.tags,
    required this.summary,
  });
}
