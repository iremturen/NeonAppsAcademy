import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/presentation/theme/app_theme.dart';
import 'package:reviva/app/presentation/theme/app_theme_mode.dart';
import 'package:reviva/app/presentation/views/welcome_view.dart';

class RevivaApp extends StatelessWidget {
  const RevivaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppThemeMode.initialMode,
      home: const WelcomePage(),
    );
  }
}