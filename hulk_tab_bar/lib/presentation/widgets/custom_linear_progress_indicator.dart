import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/constants/colors.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_model.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_text.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double value;
  final String title;

  const CustomLinearProgressIndicator({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CustomText(
            model: CustomTextModel(
              text: title,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
          CustomText(
            model: CustomTextModel(
              text: '${(value * 100).toInt()}%',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: grey,
            color: neonGreen,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
