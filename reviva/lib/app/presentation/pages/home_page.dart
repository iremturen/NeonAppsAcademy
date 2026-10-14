import 'package:flutter/material.dart';
import 'package:reviva/app/presentation/widgets/banner_ad_view.dart';
import 'package:reviva/app/presentation/widgets/custom_app_bar.dart';
import 'package:reviva/app/presentation/widgets/photo_picker_view.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDarkMode: isDarkMode,
        onThemeChanged: onThemeChanged,
      ),
      body: const SafeArea(child: PhotoPickerView()),
      bottomNavigationBar: const BannerAdView(),
    );
  }
}