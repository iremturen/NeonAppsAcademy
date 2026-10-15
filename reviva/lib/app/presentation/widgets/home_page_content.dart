import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_button.dart';
import 'package:reviva/app/presentation/models/custom_button_model.dart';
import 'package:reviva/app/presentation/widgets/photo_picker_view.dart';
import 'package:reviva/app/presentation/widgets/scan_quota_view.dart';

class HomePageContent extends StatelessWidget {
  final int remainingScans;
  final VoidCallback onWatchAd;
  final ValueChanged<File?> onImageSelected;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final VoidCallback onEnhance;

  const HomePageContent({
    super.key,
    required this.remainingScans,
    required this.onWatchAd,
    required this.onImageSelected,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.onEnhance,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ScanQuotaView(
            remainingScans: remainingScans,
            onWatchAd: onWatchAd,
          ),
          Expanded(
            child: PhotoPickerView(
              onImageSelected: onImageSelected,
              isDarkMode: isDarkMode,
              onThemeChanged: onThemeChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.spacingSmall,
              left: AppDimensions.spacingLarge,
              right: AppDimensions.spacingLarge,
              bottom: AppDimensions.spacingMedium,
            ),
            child: CustomButton(
              model: CustomButtonModel(
                icon: Icons.auto_fix_high,
                text: AppStrings.beautifyButtonText,
                gradient: AppColors.buttonGradient,
                fontSize: AppFontSize.big,
                fontWeight: AppFontWeight.bold,
                textColor: AppColors.white,
                onPressed: onEnhance,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
