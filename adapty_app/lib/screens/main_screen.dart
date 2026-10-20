import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/custom_text_model.dart';
import '../widgets/custom_text.dart';
import 'in_app_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: AppDimensions.mediumSpacing,
              left: AppDimensions.mediumSpacing,
              child: IconButton(
                tooltip: AppStrings.back,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const InAppScreen()),
                  );
                },
                icon: const Icon(Icons.arrow_back_rounded),
                color: AppColors.textPrimary,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.screenPadding),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: AppDimensions.cardMaxWidth,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.screenPadding,
                    vertical: AppDimensions.cardVerticalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.cardRadius,
                    ),
                    border: Border.all(color: AppColors.border),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x66000000),
                        blurRadius: AppDimensions.cardShadowBlurRadius,
                        offset: Offset(0, AppDimensions.cardShadowOffsetY),
                      ),
                    ],
                  ),
                  child: Column(
                    spacing: AppDimensions.mediumSpacing,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: AppDimensions.memberIconContainerSize,
                        height: AppDimensions.memberIconContainerSize,
                        decoration: BoxDecoration(
                          color: AppColors.primaryTint,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.workspace_premium_rounded,
                          color: AppColors.primary,
                          size: AppDimensions.memberIconSize,
                        ),
                      ),
                      CustomText(
                        model: CustomTextModel(
                          text: AppStrings.premiumMemberLabel,
                          fontSize: AppDimensions.captionFontSize,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      CustomText(
                        model: CustomTextModel(
                          text: AppStrings.premiumWelcome,
                          fontSize: AppDimensions.welcomeFontSize,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
