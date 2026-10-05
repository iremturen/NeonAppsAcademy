import 'package:flutter/material.dart';
import 'package:news_list_view/presentation/pages/news_view.dart';

void main() {
  runApp(const NewsListViewApp());
}

class NewsListViewApp extends StatelessWidget {
  const NewsListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewsView(),
    );
  }
}