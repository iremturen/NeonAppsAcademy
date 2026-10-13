
import 'package:flutter/cupertino.dart';
import 'package:hero_game/app/presentation/views/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeView(),
    );
  }
}
