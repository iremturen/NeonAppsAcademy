import 'package:connectly/app/common/constants/app_strings.dart';
import 'package:connectly/app/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class ConnectlyApp extends StatelessWidget {
  const ConnectlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      home: const WelcomePage(),
    );
  }
}