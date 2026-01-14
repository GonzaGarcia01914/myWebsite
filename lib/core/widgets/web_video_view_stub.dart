import 'package:flutter/material.dart';

class WebVideoView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(
        child: Text('Video disponible solo en Web.'),
      ),
    );
  }
}
