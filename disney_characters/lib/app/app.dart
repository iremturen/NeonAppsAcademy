import 'package:disney_characters/app/common/constants/app_strings.dart';
import 'package:disney_characters/app/common/constants/app_theme.dart';
import 'package:disney_characters/app/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';

class DisneyCharactersApp extends StatelessWidget {
  const DisneyCharactersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: AppTheme.lightTheme,
      home: const CharactersPage(),
    );
  }
}