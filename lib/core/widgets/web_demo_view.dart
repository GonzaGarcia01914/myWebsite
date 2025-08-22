// lib/core/widgets/web_demo_view.dart
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

// Estas dos importaciones son solo para web:
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
// ignore: avoid_web_libraries_in_flutter
import 'dart:ui_web' as ui;

class WebDemoView extends StatefulWidget {
  final String url;
  const WebDemoView({super.key, required this.url});

  @override
  State<WebDemoView> createState() => _WebDemoViewState();
}

class _WebDemoViewState extends State<WebDemoView> {
  late final html.IFrameElement _iframe;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) return; // En no-web no registramos nada

    _iframe = html.IFrameElement()
      ..src = widget.url
      ..style.border = '0'
      ..style.width =
          '100%' // importante: 100% del contenedor
      ..style.height =
          '100%' // para evitar scrolls extra
      ..setAttribute('scrolling', 'no')
      ..onLoad.listen((_) {
        if (mounted) setState(() => _loaded = true);
      });

    // Registrar el factory EN WEB usando dart:ui_web
    // Cada viewType debe ser único; usamos la propia URL.
    ui.platformViewRegistry.registerViewFactory(widget.url, (int _) => _iframe);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (!kIsWeb) {
      return Center(
        child: Text(
          'La demo interactiva solo está disponible en Web.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return Stack(
      children: [
        // El iframe (HtmlElementView) renderiza el viewer/demos
        HtmlElementView(viewType: widget.url),

        // Loader elegante hasta que el iframe dispare onLoad
        if (!_loaded)
          Container(
            color: scheme.surface, // cubre el fondo mientras carga
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: scheme.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'loading demo…',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurface.withOpacity(.75),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
