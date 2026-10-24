
import 'package:coral_memory_archive/app/common/constants/app_colors.dart';
import 'package:coral_memory_archive/app/common/constants/dimensions.dart';
import 'package:coral_memory_archive/app/common/widgets/custom_text.dart';
import 'package:coral_memory_archive/app/common/widgets/custom_icon.dart';
import 'package:coral_memory_archive/app/presentation/models/custom_button_model.dart';
import 'package:coral_memory_archive/app/presentation/models/custom_icon_model.dart';
import 'package:coral_memory_archive/app/presentation/models/custom_text_model.dart';
import 'package:flutter/material.dart';


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
            : Border.all(
                color: model.borderColor!,
                width: model.borderWidth ?? AppDimensions.defaultBorderWidth,
              ),
        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        child: InkWell(
          onTap: model.onPressed,
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.spacingMedium,
              horizontal: AppDimensions.spacingLarge,
            ),
            child: Row(
              spacing: AppDimensions.spacingSmall,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (model.icon != null) ...[
                  CustomIcon(
                    model: CustomIconModel(
                      icon: model.icon!,
                      size: model.fontSize.value,
                      color: model.textColor,
                    ),
                  ),
                ],
                Flexible(
                  child: CustomText(
                    model: CustomTextModel(
                      text: model.text,
                      fontSize: model.fontSize,
                      fontWeight: model.fontWeight,
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
