import 'package:connectly/app/common/constants/colors.dart';
import 'package:connectly/app/common/constants/dimensions.dart';
import 'package:connectly/app/common/constants/font_size.dart';
import 'package:connectly/app/common/constants/font_weight.dart';
import 'package:connectly/app/common/widgets/custom_text.dart';
import 'package:connectly/app/common/widgets/custom_text_field.dart';
import 'package:connectly/app/presentation/models/custom_text_field_model.dart';
import 'package:connectly/app/presentation/models/custom_text_model.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final CustomTextFieldModel textFieldModel;
  final bool isRequired;

  const CustomFormField({
    super.key,
    required this.title,
    required this.textFieldModel,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppDimensions.spacingSmall,
      children: [
        CustomText(
          model: CustomTextModel(
            text: isRequired ? '$title *' : title,
            fontSize: AppFontSize.small,
            fontWeight: AppFontWeight.medium,
            color: AppColors.text,
            textAlign: TextAlign.left,
          ),
        ),
        CustomTextField(
          model: textFieldModel,
        ),
      ],
    );
  }
}