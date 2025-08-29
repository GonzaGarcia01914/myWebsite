import 'package:flutter/material.dart';

/// A lightweight, asset-free phone frame wrapper for embedding web demos
/// in a mobile-like viewport (rounded corners + bezel + notch stub).
class PhoneFrame extends StatelessWidget {
  const PhoneFrame({
    super.key,
    required this.child,
    this.maxWidth = 420,
    this.aspect = 19.5 / 9.0, // common tall phone aspect ratio
    this.bezel = 12.0,
    this.cornerRadius = 42.0,
    this.screenRadius = 32.0,
  });

  final Widget child;
  final double maxWidth;
  final double aspect; // height / width
  final double bezel; // outer frame thickness
  final double cornerRadius;
  final double screenRadius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth.clamp(0, maxWidth);
        final width = w == 0 ? maxWidth : w.toDouble();
        final height = width * aspect;

        final scheme = Theme.of(context).colorScheme;
        final frameColor = scheme.surfaceContainerHighest.withValues(
          alpha: 0.90,
        );
        final screenBg = scheme.surface;

        return Center(
          child: SizedBox(
            width: width,
            height: height,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: frameColor,
                borderRadius: BorderRadius.circular(cornerRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 30,
                    offset: const Offset(0, 18),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(bezel),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenRadius),
                  child: Stack(
                    children: [
                      // Screen background
                      Positioned.fill(child: ColoredBox(color: screenBg)),
                      // Content
                      Positioned.fill(child: child),
                      // Simple notch stub (optional)
                      Positioned(
                        top: 0,
                        left: width * 0.5 - 60,
                        right: width * 0.5 - 60,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: frameColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
