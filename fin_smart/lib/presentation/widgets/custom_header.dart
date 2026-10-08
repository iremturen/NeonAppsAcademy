import 'package:fin_smart/constants/colors.dart';
import 'package:fin_smart/constants/dimensions.dart';
import 'package:fin_smart/presentation/models/custom_image_model.dart';
import 'package:fin_smart/presentation/widgets/custom_image.dart';
import 'package:flutter/material.dart';

import 'package:fin_smart/presentation/models/custom_text_model.dart';
import 'package:fin_smart/presentation/widgets/custom_text.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImage(
          model: CustomImageModel(
            imagePath: 'assets/images/icon.png',
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: iconTextSpacing),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              model: CustomTextModel(
                text: 'FINSMART',
                fontSize: headerTitleFontSzie,
                fontWeight: FontWeight.bold,
                color: darkGreen,
                textAlign: TextAlign.left,
                height: 1,
              ),
            ),
            CustomText(
              model: CustomTextModel(
                text: 'Welcome back, Sarah',
                fontSize: headersubtitleFontSzie,
                fontWeight: FontWeight.bold,
                color: green,
                textAlign: TextAlign.left,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
