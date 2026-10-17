import 'package:flutter/material.dart';

final class AppColors {
  AppColors._();

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;

  static const Color background = Color(0xFFfcfdfd);
  static const Color primary = Color(0xFF0F766E);
  static const Color secondaryText = Color.fromARGB(255, 100, 139, 130);
  static const Color text = Color.fromARGB(255, 30, 59, 56);
  static const Color border = Color.fromARGB(255, 203, 203, 203);
  static const Color error = Color(0xFFDC2626);
  static const Color success = Color(0xFF16A34A);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondaryText],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
