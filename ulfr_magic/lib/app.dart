import 'package:flutter/material.dart';
import 'package:ulfr_magic/common/constants/app_strings.dart';
import 'package:ulfr_magic/presentation/pages/home_page.dart';

class UlfrMagicApp extends StatelessWidget {
  const UlfrMagicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}