import 'package:bee_counter/presentation/view/bee_counter_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BeeCounterApp());
}

class BeeCounterApp extends StatelessWidget {
  const BeeCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BeeCounterView(),
    );
  }
}