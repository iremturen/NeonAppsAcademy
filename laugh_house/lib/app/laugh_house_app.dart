import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/presentation/views/main_view.dart';

class LaughHouseApp extends StatelessWidget {
  const LaughHouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laugh House',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.bg,
      ),
      home: const MainView(),
    );
  }
}

//mainden çekitm ayırdım