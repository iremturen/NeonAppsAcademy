import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_icon.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/data/datasources/settings_items.dart';
import 'package:reviva/app/presentation/models/custom_icon_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';
import 'package:reviva/app/presentation/utils/setting_icon_helper.dart';
import 'package:reviva/app/presentation/widgets/custom_header.dart';
import 'package:reviva/app/presentation/widgets/setting_item.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: AppStrings.settingHeaderTitle),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(AppDimensions.spacingLarge),
                children: [
                  ...settingsItems.map(
                    (title) => SettingItem(
                      icon: getSettingIcon(title),
                      title: title,
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.spacingMedium,
                    ),
                    child: CustomText(
                      model: CustomTextModel(
                        text: AppStrings.settingThemeText,
                        fontSize: AppFontSize.medium.value,
                        fontWeight: AppFontWeight.bold.value,
                        color: colorScheme.onSurface,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    secondary: CustomIcon(
                      model: CustomIconModel(
                        icon: Icons.dark_mode_outlined,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    title: CustomText(
                      model: CustomTextModel(
                        text: AppStrings.settingDarkModeText,
                        fontSize: AppFontSize.medium.value,
                        fontWeight: AppFontWeight.normal.value,
                        color: colorScheme.onSurface,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    value: widget.isDarkMode,
                    onChanged: widget.onThemeChanged,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
