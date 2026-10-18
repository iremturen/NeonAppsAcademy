
import 'package:flutter/material.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/dimensions.dart';
import 'package:task_master/app/presentation/models/custom_text_field_model.dart';

class CustomTextField extends StatelessWidget {
  final CustomTextFieldModel model;

  const CustomTextField({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: AppDimensions.textFieldMaxLength,
      controller: model.controller,
      keyboardType: model.keyboardType,
      maxLines: model.maxLines,
      validator: model.validator,
      onChanged: model.onChanged,
      decoration: InputDecoration(
        hintText: model.hintText,
        filled: true,
        fillColor: AppColors.white.withValues(
          alpha: AppDimensions.textFieldFillOpacity,
        ),
        hintStyle: const TextStyle(
          color: AppColors.secondaryText,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMedium,
          vertical: AppDimensions.spacingMedium,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.textFieldBorderRadius),
          borderSide: const BorderSide(
            color: AppColors.secondaryText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.textFieldBorderRadius),
          borderSide: const BorderSide(
            color: AppColors.secondaryText,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.textFieldBorderRadius),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppDimensions.textFieldFocusBorder,
          ),
        ),
      ),
    );
  }
}
