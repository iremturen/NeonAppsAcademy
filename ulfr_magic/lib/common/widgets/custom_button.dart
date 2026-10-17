import 'package:flutter/material.dart';
import 'package:ulfr_magic/common/widgets/custom_text.dart';
import 'package:ulfr_magic/presentation/models/custom_button_model.dart';
import 'package:ulfr_magic/presentation/models/custom_text_model.dart';
import '../../common/constants/app_dimensions.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonModel model;

  const CustomButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * AppDimensions.widthRatio,
      child: ElevatedButton(
        onPressed: model.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: model.backgroundColor,
          foregroundColor: model.textColor,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.largeSpacing,
            vertical: AppDimensions.largeSpacing,
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.buttonBorderRadius),
            side: BorderSide(
              color: model.borderColor ?? Colors.transparent,
              width: model.borderWidth,
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
