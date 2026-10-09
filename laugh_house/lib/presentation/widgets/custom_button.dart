import 'package:flutter/material.dart';
import 'package:laugh_house/presentation/models/custom_button_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonModel model;

  const CustomButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: model.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: model.backgroundColor,
        foregroundColor: model.textColor,
        padding: model.padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(model.borderRadius),
        ),
        elevation: 0,
      ),
      child: CustomText(
        model: CustomTextModel(
          text: model.text,
          fontSize: model.fontSize,
          fontWeight: model.fontWeight,
          color: model.textColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
