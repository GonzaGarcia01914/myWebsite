import 'package:flutter/material.dart';

class WebDemoView extends StatelessWidget {
  const WebDemoView({super.key, required this.url, this.height});
  final String url;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(
        child: Text('Demo disponible sólo en Web.'),
      ),
    );
  }
}

