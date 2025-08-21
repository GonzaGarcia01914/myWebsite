// Web-only util to create HtmlElementView iFrames.
import 'dart:ui_web' as ui;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void registerIFrameView(String viewType, String url) {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(viewType, (int _) {
    final el = html.IFrameElement()
      ..src = url
      ..style.border = '0'
      ..allow = 'fullscreen'
      ..sandbox?.add('allow-scripts')
      ..sandbox?.add('allow-same-origin')
      ..sandbox?.add('allow-forms')
      ..sandbox?.add('allow-popups');
    return el;
  });
}
