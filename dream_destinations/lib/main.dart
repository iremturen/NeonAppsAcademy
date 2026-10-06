import 'package:dream_destinations/presentation/views/dream_trip_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DreamTripApp());
}

class DreamTripApp extends StatelessWidget {
  const DreamTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dream Destinations',
      home: const DreamTripView(),
    );
  }
}