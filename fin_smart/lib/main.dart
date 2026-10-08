import 'package:fin_smart/presentation/views/home_view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const FinSmartApp());
}

class FinSmartApp extends StatelessWidget {
  const FinSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinSmart',
      home: const HomeView(),
    );
  }
}