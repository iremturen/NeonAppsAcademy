import 'package:flutter/material.dart';

import 'package:secret_decryption/constants/colors.dart';
import 'package:secret_decryption/presentation/models/custom_button_model.dart';
import 'package:secret_decryption/presentation/models/custom_text_model.dart';
import 'package:secret_decryption/presentation/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonModel model;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: model.width,
      height: model.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(model.borderRadius),
        boxShadow: [
          BoxShadow(
            color: blue.withValues(alpha: 0.5),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: model.backgroundColor,
          foregroundColor: model.textColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(model.borderRadius),
          ),
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
      ),
    );
  }
}