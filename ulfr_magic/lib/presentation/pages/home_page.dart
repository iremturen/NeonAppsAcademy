import 'package:flutter/material.dart';
import 'package:ulfr_magic/common/constants/app_colors.dart';
import 'package:ulfr_magic/common/constants/app_dimensions.dart';
import 'package:ulfr_magic/common/constants/app_strings.dart';
import 'package:ulfr_magic/common/widgets/custom_background.dart';
import 'package:ulfr_magic/common/widgets/custom_button.dart';
import 'package:ulfr_magic/common/widgets/custom_text.dart';
import 'package:ulfr_magic/presentation/models/custom_button_model.dart';
import 'package:ulfr_magic/presentation/models/custom_text_model.dart';
import 'package:ulfr_magic/presentation/pages/invisibility_page.dart';
import 'package:ulfr_magic/presentation/pages/movement_page.dart';
import 'package:ulfr_magic/presentation/pages/rotation_page.dart';
import 'package:ulfr_magic/presentation/pages/size_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: Center(
            child: Column(
              spacing: AppDimensions.largeSpacing,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  model: CustomTextModel(
                    text: AppStrings.homeTitle,
                    fontSize: AppDimensions.titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                    textAlign: TextAlign.center
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.invisibilitySpell,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InvisibilityPage(),
                        ),
                      );
                    },
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.rotationSpell,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RotationPage(),
                        ),
                      );
                    },
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.movementSpell,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MovementPage(),
                        ),
                      );
                    },
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.sizeSpell,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SizePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
