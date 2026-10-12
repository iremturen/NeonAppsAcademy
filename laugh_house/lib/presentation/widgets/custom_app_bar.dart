import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_image_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_image.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            CustomImage(
              model: CustomImageModel(
                imagePath: 'assets/images/logo_icon.png',
                width: iconSize,
                height: iconSize,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  model: CustomTextModel(
                    text: 'KIKIR',
                    fontSize: headerTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: white,
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomText(
                  model: CustomTextModel(
                    text: 'COMEDY CLUB',
                    fontSize: headerSubtitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: neonGreen,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
    );
  }
}
