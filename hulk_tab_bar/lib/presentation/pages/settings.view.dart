import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/constants/colors.dart';
import 'package:hulk_tab_bar/constants/dimensions.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_model.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            model: CustomTextModel(
              text: 'SETTINGS',
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
          SizedBox(height: 20),
          CustomText(
            model: CustomTextModel(
              text: 'HQ SYSTEM ONLINE',
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: neonGreen,
            ),
          ),
        ],
      ),
    );
  }
}