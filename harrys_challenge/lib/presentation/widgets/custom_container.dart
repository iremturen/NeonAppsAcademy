import 'package:flutter/material.dart';

import 'package:harrys_challenge/presentation/model/spell_model.dart';
import 'package:harrys_challenge/presentation/model/image_model.dart';
import 'package:harrys_challenge/presentation/widgets/custom_image.dart';
import 'package:harrys_challenge/presentation/widgets/custom_text.dart';
import 'package:harrys_challenge/common/constants/dimensions.dart';

class CustomContainer extends StatelessWidget {
  final SpellModel spell;

  const CustomContainer({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomImage(
          imageModel: ImageModel(
            imagePath: 'assets/images/card.png',
            color: spell.backgroundImageColor,
            fit: BoxFit.fill,
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imageModel: ImageModel(
                imagePath: spell.imagePath,
                width: iconWidth,
                height: iconHeight,
              ),
            ),
            const SizedBox(height: 8),
            CustomText(textModel: spell.textModel),

          ],
        ),
      ],
    );
  }
}
