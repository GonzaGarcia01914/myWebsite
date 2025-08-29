import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'dart:js_util' as js_util;
import 'dart:ui_web' as ui;

class WebDemoView extends StatefulWidget {
  const WebDemoView({super.key, required this.url, this.height});
  final String url;
  final double? height;

  @override
  State<WebDemoView> createState() => _WebDemoViewState();
}

class _WebDemoViewState extends State<WebDemoView> {
  late final web.HTMLIFrameElement _iframe;
  late final String _viewType;

  bool _loading = true;
  bool _showSpinner = true;

  Timer? _delay;
  Timer? _poll;
  Timer? _hardTimeout;

  web.EventListener? _onLoadListener;
  web.EventListener? _onMsgListener;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) _initIframe();
  }

  @override
  void didUpdateWidget(covariant WebDemoView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (kIsWeb && oldWidget.url != widget.url) {
      _disposeIframe();
      _initIframe();
    }
  }

  void _initIframe() {
    _loading = true;
    _showSpinner = true;

    _iframe = web.HTMLIFrameElement()
      ..style.border = '0'
      ..style.width = '100%'
      ..style.height = '100%'
      ..setAttribute('loading', 'eager')
      ..src = widget.url;

    _onLoadListener = ((web.Event _) => _markLoaded()).toJS;
    _iframe.addEventListener('load', _onLoadListener);

    _viewType = 'iframe-${widget.url.hashCode}-${DateTime.now().microsecondsSinceEpoch}';
    ui.platformViewRegistry.registerViewFactory(_viewType, (int _) => _iframe);

    _poll?.cancel();
    _poll = Timer.periodic(const Duration(milliseconds: 250), (t) {
      try {
        final win = _iframe.contentWindow;
        if (win != null) {
          final rs = win.document.readyState;
          if (rs == 'interactive' || rs == 'complete') {
            _markLoaded();
            t.cancel();
          }
        }
      } catch (_) {}
    });

    _onMsgListener = ((web.Event e) {
      final me = e as web.MessageEvent;
      final data = js_util.getProperty<Object?>(me, 'data');
      if (data is String && data == 'demo-ready') {
        _markLoaded();
      }
    }).toJS;
    web.window.addEventListener('message', _onMsgListener);

    _hardTimeout?.cancel();
    _hardTimeout = Timer(const Duration(seconds: 10), _markLoaded);

    if (mounted) setState(() {});
  }

  void _markLoaded() {
    if (!mounted || !_loading) return;
    _delay?.cancel();
    _poll?.cancel();
    _hardTimeout?.cancel();
    setState(() {
      _loading = false;
      _showSpinner = false;
    });
  }

  void _disposeIframe() {
    _delay?.cancel();
    _poll?.cancel();
    _hardTimeout?.cancel();

    if (_onLoadListener != null) {
      _iframe.removeEventListener('load', _onLoadListener);
      _onLoadListener = null;
    }
    if (_onMsgListener != null) {
      web.window.removeEventListener('message', _onMsgListener);
      _onMsgListener = null;
    }

    try {
      _iframe.src = 'about:blank';
    } catch (_) {}
  }

  @override
  void dispose() {
    if (kIsWeb) _disposeIframe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return const Center(child: Text('Demo disponible sólo en Web.'));
    }

    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(child: HtmlElementView(viewType: _viewType)),
          if (_showSpinner)
            const Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

