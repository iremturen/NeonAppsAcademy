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
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.dateContainerHorizontalPadding, vertical: AppDimensions.dateContainerVerticalPadding),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        border: Border.all(color: AppColor.white.withValues(alpha: AppDimensions.cardBorderOpacity), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            model: CustomTextModel(
              text: day,
              fontSize: AppDimensions.dateCardTitle,
              fontWeight: FontWeight.bold,
              color: AppColor.pink,
              textAlign: TextAlign.center,
            ),
          ),
          CustomText(
            model: CustomTextModel(
              text: month.toUpperCase(),
              fontSize: AppDimensions.monthCardTitle,
              fontWeight: FontWeight.bold,
              color: AppColor.white.withValues(alpha: AppDimensions.cardBorderOpacity),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
