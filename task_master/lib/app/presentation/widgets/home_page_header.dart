import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/app_string.dart';
import 'package:task_master/app/common/constants/font_size.dart';
import 'package:task_master/app/common/constants/font_weight.dart';
import 'package:task_master/app/common/widgets/custom_text.dart';
import 'package:task_master/app/presentation/models/custom_text_model.dart';

class HomePageHeader extends StatelessWidget {
  final VoidCallback onAddTask;

  const HomePageHeader({
    super.key,
    required this.onAddTask,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                model: CustomTextModel(
                  color: AppColors.secondaryText,
                  text: DateFormat('EEEE, MMMM d')
                      .format(DateTime.now())
                      .toUpperCase(),
                  fontSize: AppFontSize.small,
                  fontWeight: AppFontWeight.normal,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomText(
                model: CustomTextModel(
                  color: AppColors.text,
                  text: AppStrings.homepageTitle,
                  fontSize: AppFontSize.large,
                  fontWeight: AppFontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onAddTask,
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}