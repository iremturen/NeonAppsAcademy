import 'package:flutter/material.dart';
import 'package:ulfr_magic/common/constants/app_colors.dart';
import 'package:ulfr_magic/common/constants/app_dimensions.dart';
import 'package:ulfr_magic/common/constants/app_images.dart';
import 'package:ulfr_magic/common/constants/app_strings.dart';
import 'package:ulfr_magic/common/widgets/custom_background.dart';
import 'package:ulfr_magic/common/widgets/custom_button.dart';
import 'package:ulfr_magic/presentation/models/custom_button_model.dart';

class RotationPage extends StatefulWidget {
  const RotationPage({super.key});

  @override
  State<RotationPage> createState() => _RotationPageState();
}

class _RotationPageState extends State<RotationPage> {
  double _rotationAngle = 0;

  void _rotateLeft() {
    setState(() {
      _rotationAngle -= AppDimensions.rotationAngle;
    });
  }

  void _rotateRight() {
    setState(() {
      _rotationAngle += AppDimensions.rotationAngle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.cream,
      ),
      body: CustomBackground(
        child: SafeArea(
          child: Center(
            child: Column(
              spacing: AppDimensions.largeSpacing,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppDimensions.largeSpacing,
                  ),
                  child: AnimatedRotation(
                    turns: _rotationAngle,
                    duration: const Duration(
                      milliseconds:
                          AppDimensions.visibilityAnimationDurationMilliseconds,
                    ),
                    child: Image.asset(
                      AppImages.axe,
                      width:
                          MediaQuery.of(context).size.width *
                          AppDimensions.widthRatio,
                    ),
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.rotateLeft,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: _rotateLeft,
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.rotateRight,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: _rotateRight,
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
