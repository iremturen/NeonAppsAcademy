import 'package:aladdin_progress/constants/colors.dart';
import 'package:aladdin_progress/presentation/models/custom_button_model.dart';
import 'package:aladdin_progress/presentation/models/custom_text_model.dart';
import 'package:aladdin_progress/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonModel model;

  const CustomButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: model.width,
      height: model.height,
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(model.borderRadius),
        boxShadow: [
          BoxShadow(
            color: blue.withValues(alpha: 0.8),
            blurRadius: 16,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: blue.withValues(alpha: 0.4),
            blurRadius: 30,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: model.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: blue,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(model.borderRadius),
          ),
        ),
        child: CustomText(
          model: CustomTextModel(text: model.text, color: white),
        ),
      ),
    );
  }
}
