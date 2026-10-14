import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/presentation/pages/home_page.dart';

class SplashController {
  Future<void> navigateToHome(
    BuildContext context, {
    required bool isDarkMode,
    required ValueChanged<bool> onThemeChanged,
  }) async {
    await Future.delayed(
      const Duration(seconds: AppDimensions.animationDuration),
    );

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          isDarkMode: isDarkMode,
          onThemeChanged: onThemeChanged,
        ),
      ),
    );
  }
}