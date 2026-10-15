import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_button.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_button_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';

class ScanQuotaView extends StatelessWidget {
  final int remainingScans;
  final VoidCallback onWatchAd;

  const ScanQuotaView({
    super.key,
    required this.remainingScans,
    required this.onWatchAd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingLarge,
        vertical: AppDimensions.spacingSmall,
      ),
      padding: const EdgeInsets.all(AppDimensions.spacingMedium),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              model: CustomTextModel(
                text: '${AppStrings.freeScans} $remainingScans',
                fontSize: AppFontSize.medium.value,
                fontWeight: AppFontWeight.medium.value,
                color: AppColors.darkSurface,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Flexible(
            child: CustomButton(
              model: CustomButtonModel(
                icon: Icons.play_circle_outline,
                text: AppStrings.watchAd,
                gradient: AppColors.buttonGradient,
                fontSize: AppFontSize.small,
                fontWeight: AppFontWeight.medium,
                textColor: AppColors.darkBackground,
                onPressed: onWatchAd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
