import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/controller/splash_controller.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';

class SplashPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const SplashPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _splashController = SplashController();

  @override
  void initState() {
    super.initState();

    _splashController.navigateToHome(
      context,
      isDarkMode: widget.isDarkMode,
      onThemeChanged: widget.onThemeChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          spacing: AppDimensions.spacingMedium,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/loading.json',
              width: AppDimensions.animationSize,
              height: AppDimensions.animationSize,
              repeat: true,
            ),
            CustomText(
              model: CustomTextModel(
                text: AppStrings.splashPageSubtitle,
                fontSize: AppFontSize.medium.value,
                fontWeight: AppFontWeight.medium.value,
                color: colorScheme.onSurface,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
