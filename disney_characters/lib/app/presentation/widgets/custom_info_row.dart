import 'package:disney_characters/app/common/constants/font_size.dart';
import 'package:disney_characters/app/common/constants/font_weight.dart';
import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/dimensions.dart';
import '../../common/widgets/custom_text.dart';
import '../models/custom_text_model.dart';
import '../models/info_table_model.dart';

class CustomInfoRow extends StatelessWidget {
  final InfoTableItem model;
  final bool showDivider;

  const CustomInfoRow({
    super.key,
    required this.model,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMedium),
          child: Row(
            spacing: AppDimensions.spacingSmall,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: AppDimensions.tableFlexRatioTitle,
                child: CustomText(
                  model: CustomTextModel(
                    text: model.label,
                    fontSize: AppFontSize.small,
                    fontWeight: AppFontWeight.medium,
                    color: AppColors.secondaryText,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              Expanded(
                flex: AppDimensions.tableFlexRatioInfo,
                child: CustomText(
                  model: CustomTextModel(
                    text: model.value,
                    fontSize: AppFontSize.small,
                    textAlign: TextAlign.left,
                    fontWeight: AppFontWeight.medium,
                  ),
                ),
              ),
            ],
          ),
        ),

        if (showDivider)
          const Divider(
            height: AppDimensions.tableDividerHeight,
            indent: AppDimensions.spacingMedium,
            endIndent: AppDimensions.spacingMedium,
          ),
      ],
    );
  }
}
