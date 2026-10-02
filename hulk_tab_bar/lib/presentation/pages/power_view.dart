import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/constants/colors.dart';
import 'package:hulk_tab_bar/constants/dimensions.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_container_model.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_model.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_linear_progress_indicator.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_text_container.dart';

class PowerView extends StatelessWidget {
  const PowerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 180),
            const CustomTextContainer(
              model: CustomTextContainerModel(
                title: CustomTextModel(
                  text: 'HULK POWER',
                  color: white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: CustomTextModel(
                  text: 'Your strength level.',
                  color: grey,
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 34),
            const CustomLinearProgressIndicator(value: 0.85, title: 'STRENGTH',),

            const SizedBox(height: 34),
            const CustomLinearProgressIndicator(value: 0.63, title: 'ENERGY',),

            const SizedBox(height: 34),
            const CustomLinearProgressIndicator(value: 0.63, title: 'DEFENSE',)
          ],
        ),
      ),
    );
  }
}