import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class CustomDateCard extends StatelessWidget {
  final String day;
  final String month;

  const CustomDateCard({super.key, required this.day, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: white.withValues(alpha: 0.6), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            model: CustomTextModel(
              text: day,
              fontSize: dateCardTitle,
              fontWeight: FontWeight.bold,
              color: pink,
              textAlign: TextAlign.center,
            ),
          ),
          CustomText(
            model: CustomTextModel(
              text: month.toUpperCase(),
              fontSize: monthCardTitle,
              fontWeight: FontWeight.w600,
              color: white.withValues(alpha: 0.6),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
