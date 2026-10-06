import 'package:flutter/material.dart';
import 'package:marina_grid_view/presentation/pages/app_view.dart';

void main() {
  runApp(const MarinaGridViewApp());
}

class MarinaGridViewApp extends StatelessWidget {
  const MarinaGridViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marina Grid View',
      home: const AppsView(),
    );
  }
}