import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker_challenge/constants/colors.dart';
import 'package:picker_challenge/constants/dimensions.dart';
import 'package:picker_challenge/presentation/models/custom_tabbar_model.dart';
import 'package:picker_challenge/presentation/models/user_model.dart';

class CustomTabBar extends StatelessWidget {
  final List<CustomTabBarModel> items;
  final int selectedIndex;
  final UserModel user;
  final ValueChanged<int> onTap;

  const CustomTabBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(borderRadius),
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
                    color: isSelected ? user.color : grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.title,
                    style: GoogleFonts.getFont(
                      user.fontFamily,
                      color: isSelected ? user.color : grey,
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