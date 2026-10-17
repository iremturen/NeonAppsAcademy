import 'package:flutter/material.dart';
import 'package:ulfr_magic/common/constants/app_colors.dart';
import 'package:ulfr_magic/common/constants/app_dimensions.dart';
import 'package:ulfr_magic/common/constants/app_images.dart';
import 'package:ulfr_magic/common/constants/app_strings.dart';
import 'package:ulfr_magic/common/widgets/custom_background.dart';
import 'package:ulfr_magic/common/widgets/custom_button.dart';
import 'package:ulfr_magic/common/widgets/custom_text.dart';
import 'package:ulfr_magic/presentation/models/custom_button_model.dart';
import 'package:ulfr_magic/presentation/models/custom_text_model.dart';

class InvisibilityPage extends StatefulWidget {
  const InvisibilityPage({super.key});

  @override
  State<InvisibilityPage> createState() => _InvisibilityPageState();
}

class _InvisibilityPageState extends State<InvisibilityPage> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
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
                CustomText(
                  model: CustomTextModel(
                    text: AppStrings.invisibilitySpell,
                    fontSize: AppDimensions.titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                    textAlign: TextAlign.center,
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible
                      ? AppDimensions.fullyVisibleOpacity
                      : AppDimensions.fullyHiddenOpacity,
                  duration: const Duration(
                    milliseconds:
                        AppDimensions.visibilityAnimationDurationMilliseconds,
                  ),
                  child: Image.asset(
                    AppImages.shield,
                    width:
                        MediaQuery.of(context).size.width *
                        AppDimensions.widthRatio,
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: _isVisible ? AppStrings.hide : AppStrings.show,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: _toggleVisibility,
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
