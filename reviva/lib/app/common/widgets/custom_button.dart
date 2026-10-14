import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/colors.dart';
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
        color: model.gradient == null ? model.backgroundColor : null,
        gradient: model.gradient == null
            ? null
            : LinearGradient(
                colors: model.gradient!,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        borderRadius: BorderRadius.circular(model.borderRadius),
      ),
      child: ElevatedButton(
        onPressed: model.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: model.gradient != null
              ? Colors.transparent
              : model.backgroundColor,
          foregroundColor: model.textColor,
          padding: model.padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(model.borderRadius),
            side: BorderSide(
              color: model.borderColor,
              width: model.borderWidth,
            ),
          ),
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
