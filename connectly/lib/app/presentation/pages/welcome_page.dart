import 'package:connectly/app/common/constants/colors.dart';
import 'package:connectly/app/common/constants/app_strings.dart';
import 'package:connectly/app/common/constants/dimensions.dart';
import 'package:connectly/app/common/constants/font_size.dart';
import 'package:connectly/app/common/constants/font_weight.dart';
import 'package:connectly/app/common/constants/images.dart';
import 'package:connectly/app/common/widgets/custom_button.dart';
import 'package:connectly/app/common/widgets/custom_text.dart';
import 'package:connectly/app/presentation/models/custom_button_model.dart';
import 'package:connectly/app/presentation/models/custom_text_model.dart';
import 'package:connectly/app/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroung),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingMedium,
            ),
            child: Column(
              spacing: AppDimensions.spacingSmall,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  model: CustomTextModel(
                    text: AppStrings.appTitle,
                    fontSize: AppFontSize.title,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.primary,
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomText(
                  model: CustomTextModel(
                    text: AppStrings.welcomeTitle,
                    fontSize: AppFontSize.medium,
                    fontWeight: AppFontWeight.medium,
                    color: AppColors.text,
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomText(
                  model: CustomTextModel(
                    text: AppStrings.welcomeDescription,
                    fontSize: AppFontSize.small,
                    fontWeight: AppFontWeight.normal,
                    color: AppColors.secondaryText,
                    textAlign: TextAlign.left,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimensions.buttonPaddingTop,
                  ),
                  child: CustomButton(
                    model: CustomButtonModel(
                      text: AppStrings.startButton,
                      icon: Icons.arrow_forward_rounded,
                      gradient: AppColors.primaryGradient,
                      fontSize: AppFontSize.medium,
                      fontWeight: AppFontWeight.bold,
                      textColor: AppColors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                    ),
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
