import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/view/page_control_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const PageControlApp());
}

class PageControlApp extends StatelessWidget {
  const PageControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageControlView(),
    );
  }
}