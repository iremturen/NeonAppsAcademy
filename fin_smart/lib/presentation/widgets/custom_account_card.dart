import 'package:flutter/material.dart';

import 'package:fin_smart/constants/colors.dart';
import 'package:fin_smart/constants/dimensions.dart';
import 'package:fin_smart/presentation/models/custom_container_model.dart';
import 'package:fin_smart/presentation/models/custom_text_model.dart';
import 'package:fin_smart/presentation/widgets/custom_container.dart';
import 'package:fin_smart/presentation/widgets/custom_text.dart';

class CustomAccountCard extends StatelessWidget {
  final String accountName;
  final String balance;
  final IconData icon;

  const CustomAccountCard({
    super.key,
    required this.accountName,
    required this.balance,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: green,
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: white,
            size: iconSize,
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                model: CustomTextModel(
                  text: accountName,
                  fontSize: subtitle,
                  fontWeight: FontWeight.normal,
                  color: white,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 6),
              CustomText(
                model: CustomTextModel(
                  text: balance,
                  fontSize: subtitle,
                  fontWeight: FontWeight.bold,
                  color: white,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}