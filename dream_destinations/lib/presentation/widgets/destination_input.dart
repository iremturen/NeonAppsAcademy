import 'package:flutter/material.dart';
import 'package:dream_destinations/constants/colors.dart';
import 'package:dream_destinations/constants/dimensions.dart';
import 'package:dream_destinations/presentation/models/custom_text_model.dart';
import 'package:dream_destinations/presentation/widgets/custom_text.dart';

class DestinationInput extends StatelessWidget {
  final TextEditingController controller;

  const DestinationInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          model: CustomTextModel(
            text: 'What is the name of the place you want to visit?',
            fontSize: sectionTitleFontSize,
            fontWeight: FontWeight.bold,
            color: deepPurple,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller,
          style: TextStyle(
            color: deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: textFieldFontSize,
          ),
          decoration: InputDecoration(
            hintText: 'Enter your dream destination',
            filled: true,
            fillColor: white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
