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
          spacing: AppDimensions.bigSpacing,
          children: [
            Icon(icon, color: AppColor.pink, size: AppDimensions.profilePageIconSize),
            Expanded(
              child: CustomText(
                model: CustomTextModel(
                  text: title,
                  fontSize: AppDimensions.profilePageFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColor.grey),
          ],
        ),
      ),
    );
  }
}