import 'package:flutter/material.dart';
import 'package:harrys_challenge/presentation/view/hogwarts_view.dart';


void main() {
  runApp(const HogwartsApp());
}

class HogwartsApp extends StatelessWidget {
  const HogwartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HogwartsView(),
    );
  }
}