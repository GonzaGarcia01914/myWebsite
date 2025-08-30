import 'package:flutter/material.dart';
import '../../core/utils/scroll_nav.dart';
import 'centered_navbar.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.nav, required this.body});

  final SectionNavController nav;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isPhone = w < 480;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: isPhone ? _MobileAppBar(nav: nav) : CenteredNavBar(nav: nav),
      body: body,
    );
  }
}

/// -------- AppBar compacto para móvil --------
class _MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MobileAppBar({required this.nav});
  final SectionNavController nav;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return AppBar(
      centerTitle: true,
      toolbarHeight: preferredSize.height,
      titleSpacing: 8,
      title: DefaultTextStyle.merge(
        style: t.titleMedium?.copyWith(
          fontSize: 16, // ↓ más pequeño en móvil
          fontWeight: FontWeight.w800,
          height: 1.1,
        ),
        child: const Text('Gonzalo García'),
      ),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (id) => nav.scrollTo(context, id),
          // Mantén los ids en sync con los que registras en HomePage
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'projects', child: Text('Proyectos')),
            PopupMenuItem(value: 'resume', child: Text('Currículum')),
            PopupMenuItem(value: 'contact', child: Text('Contacto')),
          ],
        ),
      ],
      // un leve borde inferior ayuda en dark
      shape: const Border(
        bottom: BorderSide(width: 0.4, color: Colors.white24),
      ),
      // fondo semi-transparente para que no “pese” al hacer scroll
      backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.82),
      elevation: 0,
    );
  }
}
