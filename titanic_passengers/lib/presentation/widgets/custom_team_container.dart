import 'package:flutter/material.dart';

import 'package:titanic_passengers/constants/colors.dart';
import 'package:titanic_passengers/constants/dimensions.dart';
import 'package:titanic_passengers/presentation/models/custom_container_model.dart';
import 'package:titanic_passengers/presentation/models/custom_text_model.dart';
import 'package:titanic_passengers/presentation/widgets/custom_container.dart';
import 'package:titanic_passengers/presentation/widgets/custom_text.dart';

class TeamContainer extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const TeamContainer({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        model: CustomContainerModel(
          width: double.infinity,
          height: teamContainerHeight,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(teamContainerBorderRadius),
            bottomRight: Radius.circular(teamContainerBorderRadius),
          ),
          color: beige,
        ),
        child: Row(
          children: [
            Container(
              width: goldLineHeight,
              height: double.infinity,
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(teamContainerBorderRadius),
                  bottomLeft: Radius.circular(teamContainerBorderRadius),
                ),
              ),
            ),

            const SizedBox(width: 16),

            Image.asset(
              imagePath,
              width: teamLogoSizze,
              height: teamLogoSizze,
              fit: BoxFit.contain,
            ),

            const SizedBox(width: 24),

            CustomText(
              model: TextModel(
                text: title,
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.bold,
                color: greyBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}