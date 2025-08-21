import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/utils/scroll_nav.dart';

class CenteredNavBar extends StatelessWidget implements PreferredSizeWidget {
  const CenteredNavBar({super.key, required this.nav});
  final SectionNavController nav;

  // 🔝 altura mayor para que el hover/sombra NO se corte
  @override
  Size get preferredSize => const Size.fromHeight(96);

  @override
  Widget build(BuildContext context) {
    final items = const [
      _NavItem('Proyectos', 'projects'),
      _NavItem('Resume', 'resume'),
      _NavItem('Contacto', 'contact'),
    ];

    return AppBar(
      toolbarHeight: preferredSize.height, //  alto real
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent, // usamos el gradiente abajo
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleSpacing: 0,

      //  Degradado: sólido arriba → fade abajo (empieza más abajo)
      flexibleSpace: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: const SizedBox.expand(),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(
                      context,
                    ).scaffoldBackgroundColor.withValues(alpha: 0.85),
                    Theme.of(
                      context,
                    ).scaffoldBackgroundColor.withValues(alpha: 0.0),
                  ],
                  // 👉 el fade arranca más abajo para que no haya confusión visual
                  stops: const [0.0, 0.95, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),

      // Menú centrado. Le damos padding vertical extra para que la sombra del hover
      // quede DENTRO del área del AppBar y no se corte.
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ), // 👈 aire superior/inferior
        child: LayoutBuilder(
          builder: (context, c) {
            final children = items
                .map(
                  (i) => _NavButton(
                    label: i.label,
                    onTap: () => nav.scrollTo(context, i.id),
                  ),
                )
                .toList();

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _withSeparators(children, gap: 28),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String id;
  const _NavItem(this.label, this.id);
}

List<Widget> _withSeparators(List<Widget> items, {double gap = 24}) {
  final out = <Widget>[];
  for (var i = 0; i < items.length; i++) {
    out.add(items[i]);
    if (i != items.length - 1) out.add(SizedBox(width: gap));
  }
  return out;
}

/// ---- Botón con hover/elevación/borde animado (sin cortes) ----
class _NavButton extends StatefulWidget {
  const _NavButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctl;
  late final Animation<double> _t; // 0..1 suavizado

  bool _hover = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _ctl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 190),
      reverseDuration: const Duration(milliseconds: 160),
    );
    _t = CurvedAnimation(
      parent: _ctl,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeOutQuad,
    );
  }

  @override
  void dispose() {
    _ctl.dispose();
    super.dispose();
  }

  void _go(bool on) {
    if (on) {
      _ctl.forward();
    } else {
      _ctl.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: 1.02,
    );

    return FocusableActionDetector(
      onShowFocusHighlight: (v) {
        _focused = v;
        _go(_hover || _focused);
      },
      mouseCursor: SystemMouseCursors.click,
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<Intent>(
          onInvoke: (_) {
            widget.onTap();
            return null;
          },
        ),
      },
      child: MouseRegion(
        onEnter: (_) {
          _hover = true;
          _go(true);
        },
        onExit: (_) {
          _hover = false;
          _go(_focused); // si sigue enfocado, mantenemos animación
        },
        child: AnimatedBuilder(
          animation: _t,
          builder: (context, child) {
            // Interpolaciones suaves
            final dy = lerpDouble(0.0, -1.0, _t.value)!; // desplazamiento
            final bgA = lerpDouble(0.0, 0.20, _t.value)!; // alpha fondo
            final brA = lerpDouble(0.0, 0.38, _t.value)!; // alpha borde
            final shA = lerpDouble(0.0, 0.14, _t.value)!; // alpha sombra
            final blur = lerpDouble(0.0, 10.0, _t.value)!; // blur sombra
            final offY = lerpDouble(0.0, 4.0, _t.value)!; // offset sombra

            return Transform.translate(
              offset: Offset(0, dy),
              child: Container(
                decoration: BoxDecoration(
                  color: scheme.surface.withValues(alpha: bgA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: scheme.outlineVariant.withValues(alpha: brA),
                  ),
                  boxShadow: shA == 0
                      ? const []
                      : [
                          BoxShadow(
                            color: scheme.primary.withValues(alpha: shA),
                            blurRadius: blur,
                            offset: Offset(0, offY),
                          ),
                        ],
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: widget.onTap,
                    child: Padding(
                      // mantenemos el mismo formato/tamaño
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      child: Text(widget.label, style: textStyle),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
