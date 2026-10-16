import 'package:disney_characters/app/common/constants/colors.dart';
import 'package:disney_characters/app/presentation/widgets/character_detail_tables.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_strings.dart';
import '../../common/constants/dimensions.dart';
import '../../common/constants/font_size.dart';
import '../../common/constants/font_weight.dart';
import '../../common/widgets/custom_image.dart';
import '../../common/widgets/custom_text.dart';
import '../models/character_card_model.dart';
import '../models/custom_image_model.dart';
import '../models/custom_text_model.dart';
import '../widgets/custom_info_table.dart';

class CharacterDetailPage extends StatelessWidget {
  final CharacterCardModel model;

  const CharacterDetailPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final character = model.character;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: CustomText(
          model: CustomTextModel(
            text: AppStrings.characterDetails,
            fontSize: AppFontSize.medium,
            fontWeight: AppFontWeight.bold,
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.spacingMedium),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppDimensions.spacingLarge,
            children: [
              Column(
                spacing: AppDimensions.spacingSmall,
                children: [
                  AspectRatio(
                    aspectRatio: AppDimensions.characterDetailImageAspectRatio,
                    child: CustomImage(
                      model: CustomImageModel(
                        imagePath: character.imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  CustomText(
                    model: CustomTextModel(
                      text: character.name,
                      fontSize: AppFontSize.big,
                      fontWeight: AppFontWeight.bold,
                      textAlign: TextAlign.center,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              CustomInfoTable(
                model: CharacterDetailTables.basicInformation(character),
              ),

              CustomInfoTable(
                model: CharacterDetailTables.appearances(character),
              ),

              CustomInfoTable(
                model: CharacterDetailTables.relationships(character),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
