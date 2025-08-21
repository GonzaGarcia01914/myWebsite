import 'package:flutter/material.dart';

ThemeData _base(Brightness b) {
  final dark = b == Brightness.dark;
  return ThemeData(
    useMaterial3: true,
    colorScheme: dark ? const ColorScheme.dark() : const ColorScheme.light(),
    visualDensity: VisualDensity.comfortable,
    scaffoldBackgroundColor: dark ? const Color(0xFF0E0F12) : const Color(0xFFF7F8FA),
    cardTheme: const CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
      margin: EdgeInsets.all(12),
    ),
  );
}
ThemeData buildLightTheme() => _base(Brightness.light);
ThemeData buildDarkTheme()  => _base(Brightness.dark);
