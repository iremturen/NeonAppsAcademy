import 'package:flutter/material.dart';

import 'package:dream_destinations/presentation/models/custom_button_model.dart';

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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: model.backgroundColor,
          foregroundColor: model.textColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(model.borderRadius),
          ),
        ),
        child: Text(
          model.text,
          style: TextStyle(
            fontSize: model.fontSize,
            fontWeight: model.fontWeight,
            color: model.textColor,
          ),
        ),
      ),
    );
  }
}