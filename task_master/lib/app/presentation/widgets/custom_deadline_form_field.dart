import 'package:flutter/material.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/app_string.dart';
import 'package:task_master/app/common/constants/dimensions.dart';
import 'package:task_master/app/common/constants/font_size.dart';
import 'package:task_master/app/common/constants/font_weight.dart';
import 'package:task_master/app/common/widgets/custom_text.dart';
import 'package:task_master/app/presentation/models/custom_text_model.dart';

class CustomDeadlineFormField extends StatelessWidget {
  final DateTime? deadline;
  final VoidCallback onPressed;

  const CustomDeadlineFormField({
    super.key,
    required this.deadline,
    required this.onPressed,
  });

  String get _deadlineText {
    if (deadline == null) return AppStrings.taskDeadlinePickerHint;

    final date = deadline!;
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppDimensions.spacingSmall,
      children: [
        CustomText(
          model: const CustomTextModel(
            text: AppStrings.taskDeadlineLabel,
            fontSize: AppFontSize.medium,
            fontWeight: AppFontWeight.bold,
            color: AppColors.text,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: AppDimensions.textFieldHeight,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimensions.textFieldBorderRadius,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  model: CustomTextModel(
                    text: _deadlineText,
                    fontSize: AppFontSize.small,
                    fontWeight: AppFontWeight.normal,
                    color: deadline == null
                        ? AppColors.secondaryText
                        : AppColors.text,
                    textAlign: TextAlign.left,
                  ),
                ),
                const Icon(Icons.calendar_today_outlined),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
