import 'package:connectly/app/common/constants/colors.dart';
import 'package:connectly/app/common/constants/dimensions.dart';
import 'package:connectly/app/presentation/models/custom_text_field_model.dart';
import 'package:flutter/material.dart';

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
            color: AppColors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.textFieldBorderRadius),
          borderSide: const BorderSide(
            color: AppColors.border,
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
