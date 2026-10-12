import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class CustomPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomPageAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//appbar yaptım bu sefer title verdim param 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.bg,
      elevation: AppDimensions.appBarElevation,
      title: CustomText(
        model: CustomTextModel(
          text: title,
          fontSize: AppDimensions.headerTitleFontSize,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}