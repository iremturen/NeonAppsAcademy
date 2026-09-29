import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinocchio_alerts/presentation/view/pinocchio_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const PinocchioApp());
}

class PinocchioApp extends StatelessWidget {
  const PinocchioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PinocchioView(),
    );
  }
}
