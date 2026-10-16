import 'package:disney_characters/app/common/constants/colors.dart';
import 'package:disney_characters/app/common/constants/dimensions.dart';
import 'package:disney_characters/app/common/constants/font_size.dart';
import 'package:disney_characters/app/common/constants/font_weight.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_image.dart';
import '../../common/widgets/custom_text.dart';
import '../models/character_card_model.dart';
import '../models/custom_image_model.dart';
import '../models/custom_text_model.dart';

class CustomCharacterCard extends StatelessWidget {
  final CharacterCardModel model;
  final VoidCallback onTap;

  const CustomCharacterCard({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMedium),
          child: Column(
            spacing: AppDimensions.spacingMedium,
            children: [
              AspectRatio(
                aspectRatio: AppDimensions.characterCardAspectRatio,
                child: CustomImage(
                  model: CustomImageModel(
                    imagePath: model.character.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              CustomText(
                model: CustomTextModel(
                  text: model.character.name,
                  fontSize: AppFontSize.medium,
                  fontWeight: AppFontWeight.bold,
                  textAlign: TextAlign.center,
                  color: AppColors.primary,
                  maxLines: AppDimensions.cardMaxLine,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}