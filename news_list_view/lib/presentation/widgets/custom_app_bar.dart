import 'package:flutter/material.dart';
import 'package:news_list_view/constants/colors.dart';
import 'package:news_list_view/constants/dimensions.dart';
import 'package:news_list_view/presentation/models/custom_image_model.dart';
import 'package:news_list_view/presentation/models/custom_text_model.dart';
import 'package:news_list_view/presentation/widgets/custom_image.dart';
import 'package:news_list_view/presentation/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: navy,
      toolbarHeight: appBarHeight,
      titleSpacing: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: rowSpacing,
        children: [
          CustomImage(
            model: CustomImageModel(
              imagePath: 'assets/icons/newspaper.png',
              height: iconSize,
              width: iconSize,
            ),
          ),
          CustomText(
            model: CustomTextModel(
              text: 'Flutter Daily',
              fontSize: titleFontSize,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
