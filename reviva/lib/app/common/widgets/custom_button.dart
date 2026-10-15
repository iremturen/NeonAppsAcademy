import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_button_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonModel model;

  const CustomButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: model.gradient == null ? model.backgroundColor : null,
        gradient: model.gradient,
        border: model.borderColor == null
            ? null
            : Border.all(color: model.borderColor!, width: model.borderWidth),
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        boxShadow: [
          if (model.borderColor != null) ...[
            BoxShadow(
              color: AppColors.primary.withValues(alpha: AppDimensions.photoEnhancementButtonAlpha),
              offset: AppDimensions.photoEnhancementButtonOffset,
              blurRadius: AppDimensions.photoEnhancementButtonBlurRadius,
            ),
            BoxShadow(
              color: AppColors.primary.withValues(alpha: AppDimensions.photoEnhancementButtonAlpha),
              offset: AppDimensions.photoEnhancementButtonOffset,
              blurRadius: AppDimensions.photoEnhancementButtonBlurRadius,
            ),
          ],
          BoxShadow(
            color: AppColors.black.withValues(
            alpha: AppDimensions.buttonShadowAlpha,
            ),
            offset: AppDimensions.buttonShadowOffset,
            blurRadius: AppDimensions.buttonBlur,
          ),
        ],
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        child: InkWell(
          onTap: model.onPressed,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.spacingMedium,
              horizontal: AppDimensions.spacingLarge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (model.icon != null) ...[
                  Icon(
                    model.icon,
                    size: model.fontSize.value,
                    color: model.textColor,
                  ),
                  const SizedBox(width: AppDimensions.spacingSmall),
                ],
                Flexible(
                  child: CustomText(
                    model: CustomTextModel(
                      text: model.text,
                      fontSize: model.fontSize.value,
                      fontWeight: model.fontWeight.value,
                      color: model.textColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
