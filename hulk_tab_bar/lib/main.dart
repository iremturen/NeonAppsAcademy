import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/constants/colors.dart';
import 'package:hulk_tab_bar/presentation/pages/home_view.dart';

void main() {
  runApp(const HulkTabBarApp());
}

class HulkTabBarApp extends StatelessWidget {
  const HulkTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: darkGreen2,
      ),
      home: const HomeView(),
    );
  }
}