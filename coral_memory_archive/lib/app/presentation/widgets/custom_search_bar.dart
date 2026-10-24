import 'package:coral_memory_archive/app/common/widgets/custom_text_field.dart';
import 'package:coral_memory_archive/app/presentation/models/custom_text_field_model.dart';
import 'package:flutter/material.dart';
import 'package:coral_memory_archive/app/common/constants/app_string.dart';
import 'package:coral_memory_archive/app/common/constants/dimensions.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      model: CustomTextFieldModel(
        controller: controller,
        hintText: AppStrings.searchMemoriesHint,
        onChanged: onChanged,
        maxLength: AppDimensions.textFieldMaxLength,
        keyboardType: TextInputType.text,
        maxLines: 1,
      ),
    );
  }
}
