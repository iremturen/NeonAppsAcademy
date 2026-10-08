import 'package:flutter/material.dart';

import 'package:future_tech/presentation/views/home_view.dart';

void main() {
  runApp(const FutureTechApp());
}

class FutureTechApp extends StatelessWidget {
  const FutureTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FutureTech',
      home: const HomeView(),
    );
  }
}