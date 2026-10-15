import 'package:flutter/material.dart';
import 'package:reviva/app/presentation/pages/welcome_page.dart';
import 'package:reviva/app/presentation/theme/app_theme.dart';

class RevivaApp extends StatefulWidget {
  const RevivaApp({super.key});

  @override
  State<RevivaApp> createState() => _RevivaAppState();
}

class _RevivaAppState extends State<RevivaApp> {
  bool _isDarkMode = false;

  void _changeTheme(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: WelcomePage(
        isDarkMode: _isDarkMode,
        onThemeChanged: _changeTheme,
      ),
    );
  }
}
