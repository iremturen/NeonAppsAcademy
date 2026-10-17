import 'package:connectly/app/common/constants/colors.dart';
import 'package:connectly/app/common/constants/dimensions.dart';
import 'package:connectly/app/common/constants/font_size.dart';
import 'package:connectly/app/common/constants/font_weight.dart';
import 'package:connectly/app/common/widgets/custom_text.dart';
import 'package:connectly/app/data/models/remote_user_model.dart';
import 'package:connectly/app/presentation/models/custom_text_model.dart';
import 'package:flutter/material.dart';

class CustomUserCard extends StatelessWidget {
  final RemoteUserModel user;

  const CustomUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppDimensions.userCardBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDimensions.spacingMedium,
        children: [
          Row(
            spacing: AppDimensions.spacingMedium,
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, color: AppColors.white),
              ),
              Expanded(
                child: CustomText(
                  model: CustomTextModel(
                    text: user.name,
                    fontSize: AppFontSize.medium,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.primary,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: AppDimensions.spacingMedium,
            children: [
              const Icon(
                Icons.phone_outlined,
                size: AppDimensions.userCardIconSize,
                color: AppColors.secondaryText,
              ),
              Expanded(
                child: CustomText(
                  model: CustomTextModel(
                    text: user.phone,
                    fontSize: AppFontSize.small,
                    fontWeight: AppFontWeight.normal,
                    color: AppColors.secondaryText,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: AppDimensions.spacingMedium,
            children: [
              const Icon(
                Icons.email_outlined,
                size: AppDimensions.userCardIconSize,
                color: AppColors.secondaryText,
              ),
              Expanded(
                child: CustomText(
                  model: CustomTextModel(
                    text: user.email,
                    fontSize: AppFontSize.small,
                    fontWeight: AppFontWeight.normal,
                    color: AppColors.secondaryText,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
