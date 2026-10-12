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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);
//appbar a çevirdim saat şarj gözüktü evelaiton ekledim ayrım oldu
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.bg,
      elevation: AppDimensions.appBarElevation,
      title: Row(

        spacing: AppDimensions.bigSpacing,
        children: [
          CustomImage(
            model: CustomImageModel(
              imagePath: 'assets/images/logo_icon.png',
              width: AppDimensions.iconSize,
              height: AppDimensions.iconSize,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                model: CustomTextModel(
                  text: 'KIKIR',
                  fontSize: AppDimensions.headerTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomText(
                model: CustomTextModel(
                  text: 'COMEDY CLUB',
                  fontSize: AppDimensions.headerSubtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColor.neonGreen,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}