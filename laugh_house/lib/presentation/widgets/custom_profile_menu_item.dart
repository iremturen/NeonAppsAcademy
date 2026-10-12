import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Row(
          children: [
            Icon(icon, color: pink, size: profilePageIconSize),
            const SizedBox(width: 12),
            Expanded(
              child: CustomText(
                model: CustomTextModel(
                  text: title,
                  fontSize: profilePageFontSize,
                  fontWeight: FontWeight.bold,
                  color: white,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: grey),
          ],
        ),
      ),
    );
  }
}