import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_button.dart';
import 'package:reviva/app/presentation/models/custom_button_model.dart';

class EnhancementControls extends StatelessWidget {
  final bool isRunning;
  final bool isCompleted;
  final bool canStop;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onStop;
  final VoidCallback onFinish;

  const EnhancementControls({
    super.key,
    required this.isRunning,
    required this.isCompleted,
    required this.canStop,
    required this.onStart,
    required this.onPause,
    required this.onStop,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final buttonText = isCompleted
        ? AppStrings.enhancementButtonFinishText
        : isRunning
            ? AppStrings.enhancementButtonProcessingText
            : AppStrings.enhancementButtonStartText;

    return Column(
      spacing: AppDimensions.spacingSmall,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton(
          model: CustomButtonModel(
            text: buttonText,
            gradient: AppColors.buttonGradient,
            fontSize: AppFontSize.medium,
            fontWeight: AppFontWeight.bold,
            textColor: AppColors.white,
            onPressed: isCompleted
                ? onFinish
                : isRunning
                    ? null
                    : onStart,
          ),
        ),
        if (!isCompleted)
          Row(
            spacing: AppDimensions.spacingSmall,
            children: [
              Expanded(
                child: CustomButton(
                  model: CustomButtonModel(
                    borderColor: AppColors.primary,
                    borderWidth: AppDimensions.photoEnhancementButtonBorderWidth,
                    backgroundColor: colorScheme.onPrimary,
                    text: AppStrings.pauseButton,
                    fontSize: AppFontSize.medium,
                    fontWeight: AppFontWeight.medium,
                    textColor: colorScheme.primary,
                    onPressed: isRunning ? onPause : null,
                  ),
                ),
              ),
              Expanded(
                child: CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: colorScheme.onPrimary,
                    borderColor: AppColors.primary,
                    borderWidth: AppDimensions.photoEnhancementButtonBorderWidth,
                    text: AppStrings.stopButton,
                    fontSize: AppFontSize.medium,
                    fontWeight: AppFontWeight.medium,
                    textColor: colorScheme.primary,
                    onPressed: canStop ? onStop : null,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
