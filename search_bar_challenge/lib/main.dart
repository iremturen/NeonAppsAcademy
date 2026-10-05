import 'package:flutter/material.dart';
import 'package:search_bar_challenge/presentation/pages/search_view.dart';

void main() {
  runApp(const SearchBarChallengeApp());
}

class SearchBarChallengeApp extends StatelessWidget {
  const SearchBarChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SearchView(),
    );
  }
}