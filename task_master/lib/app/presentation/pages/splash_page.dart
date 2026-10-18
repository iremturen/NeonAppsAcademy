import 'package:flutter/material.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/app_images.dart';
import 'package:task_master/app/common/constants/app_string.dart';
import 'package:task_master/app/common/constants/dimensions.dart';
import 'package:task_master/app/common/constants/font_size.dart';
import 'package:task_master/app/common/constants/font_weight.dart';
import 'package:task_master/app/common/widgets/custom_text.dart';
import 'package:task_master/app/presentation/models/custom_text_model.dart';
import 'package:task_master/app/presentation/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final logoSize = screenSize.width * AppDimensions.splashLogoWidthFactor;

    return Scaffold(
      body: Center(
        child: Column(
          spacing: AppDimensions.spacingSmall,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.logo,
              width: logoSize,
              height: logoSize,
              fit: BoxFit.contain,
            ),
            CustomText(
              model: CustomTextModel(
                color: AppColors.primary,
                text: AppStrings.appTitle,
                fontSize: AppFontSize.title,
                fontWeight: AppFontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
