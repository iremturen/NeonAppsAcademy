import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primaryDark,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightText,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFA18AFF),
      onPrimary: AppColors.darkBackground,
      secondary: AppColors.primaryLight,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkText,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkText,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFA18AFF),
        foregroundColor: AppColors.darkBackground,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}