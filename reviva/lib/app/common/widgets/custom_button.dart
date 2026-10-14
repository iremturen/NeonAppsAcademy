import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_button_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonModel model;

  const CustomButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(model.borderRadius),
        boxShadow: [
          BoxShadow(
            color: model.borderColor.withValues(alpha: 0.7),
            blurRadius: AppDimensions.buttonBlurRadius,
            spreadRadius: AppDimensions.buttonSpreadRadius,
          ),
          BoxShadow(
            color: model.borderColor.withValues(alpha: 0.4),
            blurRadius: AppDimensions.buttonBlurRadius,
            spreadRadius: AppDimensions.buttonSpreadRadius,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: model.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: model.backgroundColor,
          foregroundColor: model.textColor,
          padding: model.padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(model.borderRadius),
            side: BorderSide(
              color: model.borderColor,
              width: model.borderWidth,
            ),
          ),
          elevation: 0,
        ),
        child: CustomText(
          model: CustomTextModel(
            text: model.text,
            fontWeight: model.fontWeight.value,
            textAlign: TextAlign.center,
            fontSize: model.fontSize?.value ?? AppFontSize.medium.value,
            color: model.textColor ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
