import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/controller/ad_controller.dart';
import 'package:reviva/app/presentation/controller/scan_limit_controller.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';
import 'package:reviva/app/presentation/pages/photo_enhancement_page.dart';
import 'package:reviva/app/presentation/widgets/banner_ad_view.dart';
import 'package:reviva/app/presentation/widgets/custom_app_bar.dart';
import 'package:reviva/app/presentation/widgets/home_page_content.dart';

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
          SnackBar(
            content: _buildSnackBarText(AppStrings.adNotReadyMessage),
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
    ).showSnackBar(
      SnackBar(content: _buildSnackBarText(AppStrings.extraScanEarnedMessage)),
    );
  }

  CustomText _buildSnackBarText(String text) {
    final theme = Theme.of(context);

    return CustomText(
      model: CustomTextModel(
        text: text,
        fontSize: AppFontSize.bodyMedium.value,
        fontWeight: AppFontWeight.normal.value,
        color: theme.colorScheme.onInverseSurface,
        textAlign: TextAlign.left,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
      ),
      body: HomePageContent(
        remainingScans: _remainingScans,
        onWatchAd: _onWatchAd,
        onImageSelected: _onImageSelected,
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
        onEnhance: _openEnhancementPage,
      ),
      bottomNavigationBar: BannerAdView(adController: _adController),
    );
  }
}
