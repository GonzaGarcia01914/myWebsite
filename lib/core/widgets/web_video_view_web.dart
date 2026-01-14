import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'dart:ui_web' as ui;

class WebVideoView extends StatefulWidget {
  const WebVideoView({
    super.key,
    required this.url,
    this.posterUrl,
    this.height,
  });

  final String url;
  final String? posterUrl;
  final double? height;

  @override
  State<WebVideoView> createState() => _WebVideoViewState();
}

class _WebVideoViewState extends State<WebVideoView> {
  late final web.HTMLVideoElement _video;
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) _initVideo();
  }

  @override
  void didUpdateWidget(covariant WebVideoView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (kIsWeb && oldWidget.url != widget.url) {
      _initVideo();
      if (mounted) setState(() {});
    }
  }

  void _initVideo() {
    _video = web.HTMLVideoElement()
      ..style.width = '100%'
      ..style.height = '100%'
      ..controls = true
      ..autoplay = false
      ..muted = false
      ..loop = false
      ..setAttribute('playsinline', 'true')
      ..setAttribute('preload', 'metadata')
      ..src = widget.url;

    if ((widget.posterUrl ?? '').isNotEmpty) {
      _video.setAttribute('poster', widget.posterUrl!);
    }

    _viewType = 'video-${widget.url.hashCode}-${DateTime.now().microsecondsSinceEpoch}';
    ui.platformViewRegistry.registerViewFactory(_viewType, (int _) => _video);
  }

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return const Center(child: Text('Video disponible solo en Web.'));
    }

    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: HtmlElementView(viewType: _viewType),
      ),
    );
  }
}
