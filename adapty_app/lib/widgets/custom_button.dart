import 'package:flutter/material.dart';

import '../models/custom_button_model.dart';
import '../models/custom_text_model.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.model});

  final CustomButtonModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: model.onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(AppDimensions.buttonHeight),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          disabledBackgroundColor: AppColors.disabledButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
          ),
          elevation: 0,
        ),
        child: model.isLoading
            ? const SizedBox.square(
                dimension: AppDimensions.loadingIndicatorSize,
                child: CircularProgressIndicator(
                  strokeWidth: AppDimensions.loadingStrokeWidth,
                  color: AppColors.background,
                ),
              )
            : CustomText(
                model: CustomTextModel(
                  text: model.label,
                  fontSize: AppDimensions.buttonFontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.background,
                ),
              ),
      ),
    );
  }
}
