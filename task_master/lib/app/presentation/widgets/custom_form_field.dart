import 'package:flutter/material.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/dimensions.dart';
import 'package:task_master/app/common/constants/font_size.dart';
import 'package:task_master/app/common/constants/font_weight.dart';
import 'package:task_master/app/common/widgets/custom_text.dart';
import 'package:task_master/app/common/widgets/custom_text_field.dart';
import 'package:task_master/app/presentation/models/custom_text_field_model.dart';
import 'package:task_master/app/presentation/models/custom_text_model.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final CustomTextFieldModel fieldModel;

  const CustomFormField({
    super.key,
    required this.label,
    required this.fieldModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppDimensions.spacingSmall,
      children: [
        CustomText(
          model: CustomTextModel(
            text: label,
            fontSize: AppFontSize.medium,
            fontWeight: AppFontWeight.bold,
            color: AppColors.text,
            textAlign: TextAlign.left,
          ),
        ),
        CustomTextField(model: fieldModel),
      ],
    );
  }
}
