import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacto')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _ContactCard(
                  title: 'Email',
                  subtitle: 'gonzalogarcia01914@gmail.com',
                  icon: Icons.email,
                  onTap: () => _open('mailto:gonzalogarcia01914@gmail.com'),
                ),
                _ContactCard(
                  title: 'Instagram',
                  subtitle: '@gonzagarcia019',
                  icon: Icons.camera_alt,
                  onTap: () => _open('https://instagram.com/gonzagarcia019'),
                ),
                _ContactCard(
                  title: 'Teléfono',
                  subtitle: '+48 519 116 988',
                  icon: Icons.phone,
                  onTap: () => _open('tel:+48519116988'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: SizedBox(
        width: 280,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon),
                const SizedBox(height: 12),
                Text(title, style: t.titleLarge),
                const SizedBox(height: 4),
                Text(subtitle, style: t.bodyMedium),
                const SizedBox(height: 12),
                const Text(
                  'Toca para abrir',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
