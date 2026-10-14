import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_icon.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/models/custom_icon_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CustomIcon(
        model: CustomIconModel(
          icon: icon,
          color: colorScheme.onSurface,
          size: AppDimensions.settingListIconSize,
        ),
      ),
      title: CustomText(
        model: CustomTextModel(
          text: title,
          fontSize: AppFontSize.medium.value,
          fontWeight: AppFontWeight.medium.value,
          color: colorScheme.onSurface,
          textAlign: TextAlign.start,
        ),
      ),
      trailing: CustomIcon(
        model: CustomIconModel(
          icon: Icons.chevron_right,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      onTap: onTap,
    );
  }
}