import 'package:flutter/material.dart';
import 'package:titanic_passengers/presentation/pages/passengers_view.dart';

void main() {
  runApp(const TitanicPassengersApp());
}

class TitanicPassengersApp extends StatelessWidget {
  const TitanicPassengersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PassengersView(),
    );
  }
}

