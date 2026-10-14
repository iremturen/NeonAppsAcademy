import 'package:flutter/material.dart';

final class AppColors {
  AppColors._();

  //commmon
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // main
  static const Color primary = Color(0xFF8065E9);
  static const Color primaryLight = Color.fromARGB(255, 215, 203, 249);
  static const Color primaryDark = Color(0xFF6046C7);

  // light theme
  static const Color lightBackground = Color(0xFFF8F7FC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF29243A);
  static const Color lightSecondaryText = Color(0xFF777184);
  static const Color lightBorder = Color(0xFFE9E4F4);

  // dark theme
  static const Color darkBackground = Color(0xFF171520);
  static const Color darkSurface = Color(0xFF242130);
  static const Color darkText = Color(0xFFF6F3FF);
  static const Color darkSecondaryText = Color(0xFFB7B0C9);
  static const Color darkBorder = Color(0xFF393347);
}
