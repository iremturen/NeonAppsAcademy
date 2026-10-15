import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_button.dart';
import 'package:reviva/app/presentation/controller/ad_controller.dart';
import 'package:reviva/app/presentation/controller/scan_limit_controller.dart';
import 'package:reviva/app/presentation/models/custom_button_model.dart';
import 'package:reviva/app/presentation/pages/photo_enhancement_page.dart';
import 'package:reviva/app/presentation/widgets/banner_ad_view.dart';
import 'package:reviva/app/presentation/widgets/custom_app_bar.dart';
import 'package:reviva/app/presentation/widgets/photo_picker_view.dart';
import 'package:reviva/app/presentation/widgets/scan_quota_view.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AdController _adController = AdController();
  final ScanLimitController _scanLimitController = ScanLimitController();

  File? _selectedImage;
  int _remainingScans = 2;

  @override
  void initState() {
    super.initState();
    _loadRemainingScans();
    _adController.loadRewardedAd();
  }

  Future<void> _loadRemainingScans() async {
    final remainingScans = await _scanLimitController.getRemainingScans();

    if (!mounted) return;

    setState(() {
      _remainingScans = remainingScans;
    });
  }

  @override
  void dispose() {
    _adController.dispose();
    super.dispose();
  }

  void _onImageSelected(File? image) {
    setState(() {
      _selectedImage = image;
    });
  }

  void _openEnhancementPage() {
    final imageFile = _selectedImage;

    if (imageFile == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoEnhancementPage(
          imageFile: imageFile,
          isDarkMode: widget.isDarkMode,
          onThemeChanged: widget.onThemeChanged,
        ),
      ),
    ).then((_) => _loadRemainingScans());
  }

  void _onWatchAd() {
    _adController.showRewardedAd(
      onRewardEarned: _addScanReward,
      onAdUnavailable: () {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ad is not ready yet. Please try again.'),
          ),
        );
      },
    );
  }

  Future<void> _addScanReward() async {
    await _scanLimitController.addScan();

    if (!mounted) return;

    await _loadRemainingScans();

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('You earned one extra scan!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ScanQuotaView(
              remainingScans: _remainingScans,
              onWatchAd: _onWatchAd,
            ),
            Expanded(
              child: PhotoPickerView(
                onImageSelected: _onImageSelected,
                isDarkMode: widget.isDarkMode,
                onThemeChanged: widget.onThemeChanged,
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
                  onPressed: _openEnhancementPage,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BannerAdView(adController: _adController),
    );
  }
}
