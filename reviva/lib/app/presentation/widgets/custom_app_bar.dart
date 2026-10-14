import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/constants/images.dart';
import 'package:reviva/app/common/widgets/custom_image.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_image_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSettingsTap;

  const CustomAppBar({super.key, this.onSettingsTap});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: AppDimensions.spacingMedium,
      title: Row(
        spacing: AppDimensions.spacingSmall,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImage(
            model: CustomImageModel(
              imagePath: AppImages.appIcon,
              height: AppDimensions.appIconSize,
              width: AppDimensions.appIconSize,
            ),
          ),
          CustomText(
            model: CustomTextModel(
              text: AppStrings.appTitle,
              fontSize: AppFontSize.medium.value,
              fontWeight: AppFontWeight.medium.value,
              color: colorScheme.primary,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onSettingsTap,
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}
