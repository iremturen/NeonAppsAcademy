import 'package:flutter/material.dart';

import 'package:fin_smart/constants/colors.dart';
import 'package:fin_smart/constants/dimensions.dart';
import 'package:fin_smart/presentation/models/custom_container_model.dart';
import 'package:fin_smart/presentation/models/custom_text_model.dart';
import 'package:fin_smart/presentation/widgets/custom_container.dart';
import 'package:fin_smart/presentation/widgets/custom_text.dart';

class CustomActionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomActionCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: white,
        borderRadius: borderRadius,
        border: Border.all(
          color: darkGreen.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: darkGreen,
            size: iconSize,
          ),
          const SizedBox(height: 10),
          CustomText(
            model: CustomTextModel(
              text: title,
              fontSize: subtitle,
              fontWeight: FontWeight.bold,
              color: darkGreen,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}