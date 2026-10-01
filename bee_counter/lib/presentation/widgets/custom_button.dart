import 'package:bee_counter/common/constants/dimensions.dart';
import 'package:bee_counter/presentation/model/custom_button_model.dart';
import 'package:bee_counter/presentation/model/custom_text_model.dart';
import 'package:bee_counter/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonModel model;

  const CustomButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: model.width,
      height: model.height,
      child: ElevatedButton(
        onPressed: model.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: model.backgroundColor,
          foregroundColor: model.foregroundColor,
          disabledBackgroundColor: model.backgroundColor.withValues(
            alpha:  disabledOpacity,
          ),
          disabledForegroundColor: model.foregroundColor.withValues(
            alpha: disabledOpacity,
          ),
          elevation: model.elevation,
          shadowColor: model.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(model.borderRadius),
          ),
        ),
        child: CustomText(
          model: CustomTextModel(
            text: model.text,
            fontSize: buttonFontSize,
            fontWeight: FontWeight.bold,
            color: model.foregroundColor,
          ),
        ),
      ),
    );
  }
}
