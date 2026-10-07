import 'package:flutter/material.dart';
import 'package:travel_ease/presentation/views/travel_ease_view.dart';

void main() {
  runApp(const TravelEaseApp());
}

class TravelEaseApp extends StatelessWidget {
  const TravelEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TravelEaseView(),
    );
  }
}