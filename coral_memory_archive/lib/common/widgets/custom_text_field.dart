import 'package:coral_memory_archive/common/constants/app_colors.dart';
import 'package:coral_memory_archive/common/constants/dimensions.dart';
import 'package:coral_memory_archive/presentation/models/custom_text_field_model.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final CustomTextFieldModel model;

  const CustomTextField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: model.maxLength,
      controller: model.controller,
      keyboardType: model.keyboardType,
      maxLines: model.maxLines,
      validator: model.validator,
      onChanged: model.onChanged,
      decoration: InputDecoration(
        hintText: model.hintText,
        labelText: model.labelText,
        filled: true,
        fillColor: AppColors.surface.withValues(
          alpha: AppDimensions.textFieldFillOpacity,
        ),
        hintStyle: const TextStyle(color: AppColors.secondaryText),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMedium,
          vertical: AppDimensions.spacingMedium,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppDimensions.textFieldFocusBorder,
          ),
        ),
      ),
    );
  }
}
