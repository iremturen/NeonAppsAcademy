import 'package:flutter/material.dart';
import 'package:laugh_house/presentation/views/memories_view.dart';
import 'package:laugh_house/presentation/widgets/custom_navigation_bar.dart';
import 'package:laugh_house/presentation/views/home_view.dart';
import 'package:laugh_house/presentation/views/my_tickets_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeView(),
      MyTicketsView(
        onExploreEvents: () {
          setState(() {
            _currentIndex = 0;
          });
        },
      ),
      const MemoriesView(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

