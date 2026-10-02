import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/constants/colors.dart';
import 'package:hulk_tab_bar/constants/dimensions.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_model.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_text.dart';

class MissionView extends StatelessWidget {
  const MissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText(
            model: CustomTextModel(
              text: 'CURRENT MISSION',
              fontSize: titleFontSize,
              fontWeight: FontWeight.w800,
              color: white,
            ),
          ),
          const SizedBox(height: 24),
          const Icon(
            Icons.warning_rounded,
            size: iconSize,
            color: neonGreen,
          ),
          const SizedBox(height: 20),
          const CustomText(
            model: CustomTextModel(
              text: 'DEFUSE THE BOMB',
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
          const SizedBox(height: 12),
          const CustomText(
            model: CustomTextModel(
              text: 'Threat Level: HIGH',
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
            ),
          ),
        ],
      ),
    );
  }
}