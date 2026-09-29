import 'package:flutter/material.dart';

import 'package:pinocchio_alerts/common/constants/colors.dart';
import 'package:pinocchio_alerts/common/constants/dimensions.dart';
import 'package:pinocchio_alerts/presentation/model/image_button_model.dart';
import 'package:pinocchio_alerts/presentation/model/text_model.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_image_button.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_text.dart';
import 'package:pinocchio_alerts/presentation/widgets/alert_button.dart';
import 'package:pinocchio_alerts/presentation/data/alert_buttons.dart';

class PinocchioView extends StatelessWidget {
  const PinocchioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100),

            CustomImageButton(
              model: ImageButtonModel(
                imagePath: 'assets/images/pinocchio_badge.png',
                width: badgeWidth,
                height: badgeHeight,
                fit: BoxFit.contain,
              ),
            ),

            CustomText(
              model: TextModel(
                text: 'Pinocchio Alerts',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darkBrown,
              ),
            ),

            CustomText(
              model: TextModel(
                text: 'Choose an alert challange',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: yellow,
              ),
            ),

            const SizedBox(height: 80),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: gridCount,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.0,
                  children: alertButtons(context).map((button) {
                    return AlertButton(model: button);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
