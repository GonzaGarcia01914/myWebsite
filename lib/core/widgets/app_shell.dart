import 'package:flutter/material.dart';
import '../../core/utils/scroll_nav.dart';
import 'centered_navbar.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.nav, required this.body});

  final SectionNavController nav;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CenteredNavBar(nav: nav),
      body: body,
    );
  }

  // void _openOverlay(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierColor: Colors.black54,
  //     builder: (_) => Center(
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(24),
  //         child: BackdropFilter(
  //           filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
  //           child: Material(
  //             color: Theme.of(
  //               context,
  //             ).colorScheme.surface.withValues(alpha: 0.78),
  //             elevation: 10,
  //             child: ConstrainedBox(
  //               constraints: const BoxConstraints(maxWidth: 900),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(24),
  //                 child: _CenterBigNav(
  //                   onSelected: (route) {
  //                     Navigator.of(context).pop();
  //                     nav.scrollTo(context, route);
  //                   },
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// class _CenterBigNav extends StatelessWidget {
//   const _CenterBigNav({required this.onSelected});
//   final void Function(String id) onSelected;

//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context).textTheme;
//     final items = const [
//       (_Nav('Proyectos', 'projects', Icons.apps)),
//       (_Nav('Experiencia', 'experience', Icons.work_outline)),
//       (_Nav('Resume', 'resume', Icons.description_outlined)),
//       (_Nav('Contacto', 'contact', Icons.mail_outline)),
//     ];

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           'Navega por mi portfolio',
//           style: t.displaySmall?.copyWith(fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 18),
//         Wrap(
//           alignment: WrapAlignment.center,
//           spacing: 16,
//           runSpacing: 16,
//           children: items
//               .map(
//                 (e) => _BigButton(
//                   label: e.label,
//                   icon: e.icon,
//                   onTap: () => onSelected(e.id),
//                 ),
//               )
//               .toList(),
//         ),
//       ],
//     );
//   }
// }

// class _Nav {
//   final String label;
//   final String id;
//   final IconData icon;
//   const _Nav(this.label, this.id, this.icon);
// }

// class _BigButton extends StatelessWidget {
//   const _BigButton({
//     required this.label,
//     required this.icon,
//     required this.onTap,
//   });
//   final String label;
//   final IconData icon;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     final scheme = Theme.of(context).colorScheme;
//     return InkWell(
//       borderRadius: BorderRadius.circular(20),
//       onTap: onTap,
//       child: Ink(
//         padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               scheme.primary.withValues(alpha: 0.10),
//               scheme.secondary.withValues(alpha: 0.07),
//             ],
//           ),
//           border: Border.all(
//             color: scheme.outlineVariant.withValues(alpha: 0.35),
//           ),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, size: 28),
//             const SizedBox(width: 12),
//             Text(label, style: Theme.of(context).textTheme.headlineSmall),
//           ],
//         ),
//       ),
//     );
//   }
// }
