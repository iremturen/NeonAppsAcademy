import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/view/scroll_view_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const TonyScrollViewApp());
}

class TonyScrollViewApp extends StatelessWidget {
  const TonyScrollViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollViewPage(),
    );
  }
}