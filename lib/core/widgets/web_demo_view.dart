import 'dart:ui' as ui;
import 'dart:html' as html;
import 'package:flutter/material.dart';

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

    _iframe = html.IFrameElement()
      ..src = widget.url
      ..style.border = '0'
      ..style.width = '100%'
      ..style.height = '100%'
      ..setAttribute('scrolling', 'no')
      ..onLoad.listen((_) {
        if (mounted) {
          setState(() => _loaded = true);
        }
      });

    // Registrar el viewType con la URL para que HtmlElementView lo use
    // ⚠️ viewType debe ser único por url
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(widget.url, (int _) => _iframe);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HtmlElementView(viewType: widget.url),
        if (!_loaded)
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
