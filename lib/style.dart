import 'package:flutter/material.dart';

class Style {
  static TextStyle titleTheme(ColorScheme colors) {
    return TextStyle(fontSize: 24);
  }

  static TextStyle smallTitleTheme(ColorScheme colors) {
    return TextStyle(fontSize: 18, fontWeight: .w500);
  }

  static TextStyle descTheme(ColorScheme colors) {
    return TextStyle(fontSize: 14, color: colors.secondary);
  }

  static TextStyle bodyTheme(ColorScheme colors) {
    return TextStyle(fontSize: 14);
  }
}
