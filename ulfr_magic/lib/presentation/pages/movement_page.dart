import 'package:flutter/material.dart';
import 'package:ulfr_magic/common/constants/app_colors.dart';
import 'package:ulfr_magic/common/constants/app_dimensions.dart';
import 'package:ulfr_magic/common/constants/app_images.dart';
import 'package:ulfr_magic/common/constants/app_strings.dart';
import 'package:ulfr_magic/common/widgets/custom_background.dart';
import 'package:ulfr_magic/common/widgets/custom_button.dart';
import 'package:ulfr_magic/presentation/models/custom_button_model.dart';

class MovementPage extends StatefulWidget {
  const MovementPage({super.key});

  @override
  State<MovementPage> createState() => _MovementPageState();
}

class _MovementPageState extends State<MovementPage> {
  bool _isMovedUp = false;

  void _moveUp() {
    setState(() {
      _isMovedUp = true;
    });
  }

  void _moveDown() {
    setState(() {
      _isMovedUp = false;
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
                AnimatedSlide(
                  offset: Offset(
                    AppDimensions.movementOffsetX,
                    _isMovedUp
                        ? AppDimensions.movementUpOffsetY
                        : AppDimensions.movementRestOffsetY,
                  ),
                  duration: const Duration(
                    milliseconds:
                        AppDimensions.visibilityAnimationDurationMilliseconds,
                  ),
                  child: Image.asset(
                    AppImages.rune,
                    width: MediaQuery.of(context).size.width *
                        AppDimensions.widthRatio,
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.moveUp,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: _moveUp,
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.moveDown,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: _moveDown,
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
