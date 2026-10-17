import 'package:flutter/material.dart';
import 'package:ulfr_magic/common/constants/app_colors.dart';
import 'package:ulfr_magic/common/constants/app_dimensions.dart';
import 'package:ulfr_magic/common/constants/app_images.dart';
import 'package:ulfr_magic/common/constants/app_strings.dart';
import 'package:ulfr_magic/common/widgets/custom_background.dart';
import 'package:ulfr_magic/common/widgets/custom_button.dart';
import 'package:ulfr_magic/presentation/models/custom_button_model.dart';

class SizePage extends StatefulWidget {
  const SizePage({super.key});

  @override
  State<SizePage> createState() => _SizePageState();
}

class _SizePageState extends State<SizePage> {
  double _imageSize = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_imageSize == 0) {
      _imageSize = MediaQuery.of(context).size.width * AppDimensions.widthRatio;
    }
  }

  void _increaseSize() {
    final double maxImageSize =
        MediaQuery.of(context).size.width * AppDimensions.maxSizeRatio;

    setState(() {
      if (_imageSize < maxImageSize) {
        _imageSize +=
            MediaQuery.of(context).size.width * AppDimensions.sizeChangeRatio;

        if (_imageSize > maxImageSize) {
          _imageSize = maxImageSize;
        }
      }
    });
  }

  void _decreaseSize() {
    final double minImageSize =
        MediaQuery.of(context).size.width * AppDimensions.minSizeRatio;

    setState(() {
      if (_imageSize > minImageSize) {
        _imageSize -=
            MediaQuery.of(context).size.width * AppDimensions.sizeChangeRatio;

        if (_imageSize < minImageSize) {
          _imageSize = minImageSize;
        }
      }
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
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds:
                        AppDimensions.visibilityAnimationDurationMilliseconds,
                  ),
                  curve: Curves.easeInOut,
                  width: _imageSize,
                  height: _imageSize,
                  child: Image.asset(AppImages.crystal, fit: BoxFit.contain),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.increaseSize,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: _increaseSize,
                  ),
                ),
                CustomButton(
                  model: CustomButtonModel(
                    backgroundColor: AppColors.brown,
                    text: AppStrings.decreaseSize,
                    fontSize: AppDimensions.buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cream,
                    onPressed: _decreaseSize,
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
