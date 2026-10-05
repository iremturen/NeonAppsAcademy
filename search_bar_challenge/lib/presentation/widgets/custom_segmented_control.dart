import 'package:flutter/material.dart';

import 'package:search_bar_challenge/constants/colors.dart';
import 'package:search_bar_challenge/constants/dimension.dart';
import 'package:search_bar_challenge/presentation/models/custom_text_model.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_text.dart';

class CustomSegmentedControl extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String> onChanged;
  final double? width;

  const CustomSegmentedControl({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: SegmentedButton<String>(
      showSelectedIcon: false,
      segments: [
        ButtonSegment<String>(
          value: 'name',
          label: CustomText(
            model: CustomTextModel(
              text: 'Name',
              color: selectedValue == 'name' ? white : black,
            ),
          ),
        ),
        ButtonSegment<String>(
          value: 'surname',
          label: CustomText(
            model: CustomTextModel(
              text: 'Surname',
              color: selectedValue == 'surname' ? white : black,
            ),
          ),
        ),
      ],
      selected: {selectedValue},
      onSelectionChanged: (selection) {
        onChanged(selection.first);
      },
      style: ButtonStyle(
        side: const WidgetStatePropertyAll(
          BorderSide(color: black, width: 1),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return red;
          }
          return white;
        }),
      ),
      ),
    );
  }
}