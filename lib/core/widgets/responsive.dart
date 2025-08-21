import 'package:flutter/widgets.dart';

typedef ResponsiveBuilder = Widget Function(BuildContext, Size);

class Responsive extends StatelessWidget {
  const Responsive({super.key, required this.builder});
  final ResponsiveBuilder builder;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return builder(context, size);
  }
}
