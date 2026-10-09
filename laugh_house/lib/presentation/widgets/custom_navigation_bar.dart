import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/navigation_bar_data.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: bg,
      selectedItemColor: neonGreen,
      unselectedItemColor: grey,
      selectedFontSize: navigationBarFontSize,
      unselectedFontSize: navigationBarFontSize - 1,
      showUnselectedLabels: true,
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(icons[index], size: navigationBarIconSize),
          label: labels[index],
        ),
      ),
    );
  }
}
