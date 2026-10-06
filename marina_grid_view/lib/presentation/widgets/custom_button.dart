import 'package:flutter/material.dart';

import 'package:marina_grid_view/presentation/models/custom_button_model.dart';
import 'package:marina_grid_view/presentation/widgets/custom_text.dart';
import 'package:marina_grid_view/presentation/models/custom_text_model.dart';

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
          elevation: 0,
          padding: model.padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              model.borderRadius,
            ),
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
