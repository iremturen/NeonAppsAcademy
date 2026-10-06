import 'package:flutter/material.dart';

import 'package:dream_destinations/constants/colors.dart';
import 'package:dream_destinations/constants/dimensions.dart';
import 'package:dream_destinations/presentation/models/custom_text_model.dart';
import 'package:dream_destinations/presentation/widgets/custom_text.dart';

class CustomCounter extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomCounter({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: value > 0 ? onDecrement : null,
            icon: const Icon(Icons.remove),
            color: deepPurple,
          ),
          CustomText(
            model: CustomTextModel(
              text: '$value',
              fontSize: counterTextSize,
              fontWeight: FontWeight.bold,
              color: deepPurple,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add),
            color: deepPurple,
          ),
        ],
      ),
    );
  }
}