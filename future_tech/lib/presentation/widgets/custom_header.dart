import 'package:flutter/material.dart';

import 'package:future_tech/constants/colors.dart';
import 'package:future_tech/constants/dimension.dart';
import 'package:future_tech/presentation/models/custom_image_model.dart';
import 'package:future_tech/presentation/models/custom_text_model.dart';
import 'package:future_tech/presentation/widgets/custom_image.dart';
import 'package:future_tech/presentation/widgets/custom_text.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImage(
          model: CustomImageModel(
            imagePath: 'assets/images/home_icon.png',
            width: iconSize,
            height: iconSize,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              model: CustomTextModel(
                text: 'FUTURETECH',
                fontSize: headerTitleFontSize,
                fontWeight: FontWeight.bold,
                color: green,
                textAlign: TextAlign.left,
              ),
            ),
            CustomText(
              model: CustomTextModel(
                text: 'SMART HOME • 2050',
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.bold,
                color: white.withValues(alpha: 0.7),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
