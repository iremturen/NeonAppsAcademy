import 'package:flutter/material.dart';

import 'package:dream_destinations/constants/colors.dart';
import 'package:dream_destinations/constants/dimensions.dart';
import 'package:dream_destinations/presentation/models/custom_container_model.dart';
import 'package:dream_destinations/presentation/models/custom_text_model.dart';
import 'package:dream_destinations/presentation/widgets/custom_container.dart';
import 'package:dream_destinations/presentation/widgets/custom_text.dart';

class LastVisited extends StatelessWidget {
  final String? destination;
  final bool? hasVisited;
  final int? visitCount;

  const LastVisited({
    super.key,
    required this.destination,
    required this.hasVisited,
    required this.visitCount,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        color: Colors.transparent,
        borderRadius: borderRadius,
        width: double.infinity,
        padding: const EdgeInsets.all(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            model: CustomTextModel(
              text: 'Last Visited',
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: deepPurple,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),

          CustomText(
            model: CustomTextModel(
              text: 'Destination: ${destination ?? 'No saved destination'}',
              fontSize: textFontSize,
              fontWeight: FontWeight.bold,
              color: deepPurple,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 4),

          CustomText(
            model: CustomTextModel(
              text: 'Visited before: ${hasVisited == null ? 'Not selected' : hasVisited! ? 'Yes' : 'No'}',
              fontSize: textFontSize,
              fontWeight: FontWeight.bold,
              color: deepPurple,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 4),

          CustomText(
            model: CustomTextModel(
              text: 'Visit count: ${visitCount ?? 0}',
              fontSize: textFontSize,
              fontWeight: FontWeight.bold,
              color: deepPurple,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}