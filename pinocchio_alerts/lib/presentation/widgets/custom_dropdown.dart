import 'package:flutter/material.dart';

import 'package:pinocchio_alerts/common/constants/colors.dart';
import 'package:pinocchio_alerts/common/constants/dimensions.dart';
import 'package:pinocchio_alerts/presentation/model/dropdown_model.dart';
import 'package:pinocchio_alerts/presentation/model/text_model.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_text.dart';

class CustomDropdown extends StatelessWidget {
  final DropdownModel model;

  const CustomDropdown({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: model.selectedValue,
      dropdownColor: cream,
      underline: const SizedBox(),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: darkBrown,
      ),
      items: model.options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: CustomText(
            model: TextModel(
              text: option,
              fontSize: subtitleFontSize,
              color: darkBrown,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          model.onChanged(value);
        }
      },
    );
  }
}