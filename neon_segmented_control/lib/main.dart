import 'package:flutter/material.dart';

import 'presentation/view/segmented_control_view.dart';

void main() {
  runApp(const NeonSegmentedControlApp());
}

class NeonSegmentedControlApp extends StatelessWidget {
  const NeonSegmentedControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SegmentedControlView(),
    );
  }
}