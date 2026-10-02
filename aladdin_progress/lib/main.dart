import 'package:aladdin_progress/presentation/view/aladdin_progress_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AladdinProgressApp());
}

class AladdinProgressApp extends StatelessWidget {
  const AladdinProgressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AladdinProgressView(),
    );
  }
}