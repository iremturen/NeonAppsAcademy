import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/constants/images.dart';
import 'package:reviva/app/common/widgets/custom_button.dart';
import 'package:reviva/app/common/widgets/custom_image.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_button_model.dart';
import 'package:reviva/app/presentation/models/custom_image_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';
import 'package:reviva/app/presentation/pages/splash_page.dart';

class WelcomePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const WelcomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.welcomePageBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppDimensions.spacingSmall,
                  children: [
                    CustomImage(
                      model: CustomImageModel(
                        imagePath: AppImages.appIcon,
                        width: AppDimensions.welcomePageIconSize,
                        height: AppDimensions.welcomePageIconSize,
                        fit: BoxFit.contain,
                      ),
                    ),

                    CustomText(
                      model: CustomTextModel(
                        text: AppStrings.appTitle,
                        fontSize: AppFontSize.title.value,
                        fontWeight: AppFontWeight.bold.value,
                        color: colorScheme.onSurface,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    CustomText(
                      model: CustomTextModel(
                        text: AppStrings.welcomePageSubtitle,
                        fontSize: AppFontSize.medium.value,
                        fontWeight: AppFontWeight.medium.value,
                        color: colorScheme.onSurface,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    CustomText(
                      model: CustomTextModel(
                        text: AppStrings.welcomePageSubtitle2,
                        fontSize: AppFontSize.small.value,
                        fontWeight: AppFontWeight.medium.value,
                        color: colorScheme.onSurface,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    model: CustomButtonModel(
                      gradient: AppColors.buttonGradient,
                      fontSize: AppFontSize.medium,
                      fontWeight: AppFontWeight.bold,
                      textColor: colorScheme.onPrimary,
                      text: AppStrings.startButton,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SplashPage(
                              isDarkMode: isDarkMode,
                              onThemeChanged: onThemeChanged,
                            ),
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
