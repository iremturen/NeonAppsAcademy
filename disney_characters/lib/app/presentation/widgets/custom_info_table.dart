import 'package:disney_characters/app/common/constants/colors.dart';
import 'package:disney_characters/app/common/constants/font_size.dart';
import 'package:disney_characters/app/common/constants/font_weight.dart';
import 'package:flutter/material.dart';

import '../../common/constants/dimensions.dart';
import '../../common/widgets/custom_text.dart';
import '../models/info_table_model.dart';
import '../models/custom_text_model.dart';
import 'custom_info_row.dart';

class CustomInfoTable extends StatelessWidget {
  final InfoTableModel model;

  const CustomInfoTable({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppDimensions.spacingMedium,
      children: [
        CustomText(
          model: CustomTextModel(
            text: model.title,
            fontSize: AppFontSize.medium,
            fontWeight: AppFontWeight.bold,
            textAlign: TextAlign.left,
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
            border: Border.all(
              color: AppColors.secondaryText,
            ),
          ),
          child: Column(
            children: [
              for (int index = 0; index < model.items.length; index++)
                CustomInfoRow(
                  model: model.items[index],
                  showDivider: index < model.items.length - 1,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
