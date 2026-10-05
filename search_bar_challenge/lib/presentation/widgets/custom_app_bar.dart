import 'package:flutter/material.dart';

import 'package:search_bar_challenge/constants/colors.dart';
import 'package:search_bar_challenge/constants/dimension.dart';
import 'package:search_bar_challenge/presentation/models/custom_image_model.dart';
import 'package:search_bar_challenge/presentation/models/custom_text_model.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_image.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      toolbarHeight: appBarHeight,
      title: Row(
        spacing: rowSpacing,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12,),
          CustomImage(
            model: CustomImageModel(
              imagePath: 'assets/images/heart.gif',
              height: iconSize,
              width: iconSize,
            ),
          ),
          CustomText(
            model: CustomTextModel(
              text: 'Find your lovebird',
              fontSize: titleFontSize,
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}