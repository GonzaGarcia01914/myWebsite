import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:portfolio_web/core/utils/register_iframe.dart';

class WebDemoView extends StatelessWidget {
  const WebDemoView({super.key, required this.url});
  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return const Center(child: Text('Demo no disponible'));
    }
    if (!kIsWeb) {
      return const Center(
        child: Text('La demo interactiva está disponible en la versión Web.'),
      );
    }

    final viewType = 'demo-${url.hashCode}';
    registerIFrameView(viewType, url!);

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: HtmlElementView(viewType: 'demo-0'), // se reemplaza abajo
      ),
    )._withViewType(viewType);
  }
}

extension on Widget {
  Widget _withViewType(String viewType) {
    return Builder(
      builder: (_) =>
          SizedBox.expand(child: HtmlElementView(viewType: viewType)),
    );
  }
}
