import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/constants/images.dart';
import 'package:reviva/app/common/widgets/custom_icon.dart';
import 'package:reviva/app/common/widgets/custom_image.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_icon_model.dart';
import 'package:reviva/app/presentation/models/custom_image_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';
import 'package:reviva/app/presentation/pages/settings_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final VoidCallback? onSettingsTap;

  const CustomAppBar({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
    this.onSettingsTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
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
              fontSize: AppFontSize.big.value,
              fontWeight: AppFontWeight.bold.value,
              color: colorScheme.primary,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppDimensions.spacingMedium),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    onThemeChanged: onThemeChanged,
                  ),
                ),
              );
            },
            icon: CustomIcon(
              model: CustomIconModel(
                icon: CupertinoIcons.settings,
                size: AppDimensions.appBarSettingIconSize,
                color: colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
