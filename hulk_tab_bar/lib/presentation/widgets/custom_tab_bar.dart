import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/constants/colors.dart';
import 'package:hulk_tab_bar/presentation/models/custom_tab_bar_model.dart';

class CustomTabBar extends StatelessWidget {
  final List<CustomTabBarModel> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomTabBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            final item = items[index];
            final isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () => onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: isSelected ? neonGreen : grey,
                  ),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: isSelected ? neonGreen : grey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}