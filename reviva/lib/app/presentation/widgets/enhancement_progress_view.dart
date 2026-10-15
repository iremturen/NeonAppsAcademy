import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';

class EnhancementProgressView extends StatelessWidget {
  final double progress;

  const EnhancementProgressView({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      spacing: AppDimensions.spacingSmall,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          model: CustomTextModel(
            text: '${(progress * AppDimensions.progressRate).round()}%',
            fontSize: AppFontSize.big.value,
            fontWeight: AppFontWeight.bold.value,
            color: colorScheme.primary,
            textAlign: TextAlign.center,
          ),
        ),
        CustomText(
          model: CustomTextModel(
            text: progress >= 1
                ? AppStrings.enhancementComplate
                : AppStrings.enhancementDuration,
            fontSize: AppFontSize.medium.value,
            fontWeight: AppFontWeight.normal.value,
            color: colorScheme.onSurface,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}