import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_icon.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_icon_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';

class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacingLarge),
      child: Row(
        spacing: AppDimensions.spacingMedium,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: CustomIcon(
              model: CustomIconModel(
                icon: Icons.arrow_back_ios_new,
                color: Theme.of(context).colorScheme.onSurface,
                size: AppDimensions.backIconSize,
              ),
            ),
          ),
          CustomText(
            model: CustomTextModel(
              text: title,
              fontSize: AppFontSize.big.value,
              fontWeight: AppFontWeight.bold.value,
              color: Theme.of(context).colorScheme.onSurface,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}