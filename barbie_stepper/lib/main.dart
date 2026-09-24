import 'package:barbie_stepper/presentation/view/stepper_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BarbieStepperApp());
}

class BarbieStepperApp extends StatelessWidget {
  const BarbieStepperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepperView(),
    );
  }
}