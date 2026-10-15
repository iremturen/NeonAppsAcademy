import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/controller/ad_controller.dart';
import 'package:reviva/app/presentation/controller/photo_enhancement_controller.dart';
import 'package:reviva/app/presentation/controller/scan_limit_controller.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';
import 'package:reviva/app/presentation/pages/home_page.dart';
import 'package:reviva/app/presentation/widgets/custom_header.dart';
import 'package:reviva/app/presentation/widgets/enhancement_controls.dart';
import 'package:reviva/app/presentation/widgets/enhancement_photo_preview.dart';
import 'package:reviva/app/presentation/widgets/enhancement_progress_view.dart';

class PhotoEnhancementPage extends StatefulWidget {
  final File imageFile;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const PhotoEnhancementPage({
    super.key,
    required this.imageFile,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<PhotoEnhancementPage> createState() => _PhotoEnhancementPageState();
}

class _PhotoEnhancementPageState extends State<PhotoEnhancementPage>
    with SingleTickerProviderStateMixin {
  late final PhotoEnhancementController _controller;
  late final AdController _adController;
  late final ScanLimitController _scanLimitController;

  @override
  void initState() {
    super.initState();

    _controller = PhotoEnhancementController(vsync: this, onUpdate: _updateUI);

    _adController = AdController();
    _adController.loadInterstitialAd();

    _scanLimitController = ScanLimitController();
  }

  void _updateUI() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _startScan() async {
    final canScan = await _scanLimitController.useScan();

    if (!mounted) return;

    if (canScan) {
      _controller.startOrResume();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.darkBorder,
          content: CustomText(
            model: CustomTextModel(
              text:AppStrings.warning,
              fontSize: AppFontSize.small.value,
              fontWeight: AppFontWeight.medium.value,
              color: AppColors.white,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }

  void _showInterstitialAd() {
    _adController.showInterstitialAd(
      onAdDismissed: () {
        if (!mounted) return;

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => HomePage(
              isDarkMode: widget.isDarkMode,
              onThemeChanged: widget.onThemeChanged,
            ),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _adController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: AppStrings.enhancementPageHeaderTitle),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingLarge),
                child: Column(
                  spacing: AppDimensions.spacingMedium,
                  children: [
                    Expanded(
                      child: Center(
                        child: EnhancementPhotoPreview(
                          imageFile: widget.imageFile,
                          controller: _controller.animationController,
                          isRunning: _controller.isRunning,
                        ),
                      ),
                    ),
                    EnhancementProgressView(progress: _controller.progress),
                    EnhancementControls(
                      isRunning: _controller.isRunning,
                      isCompleted: _controller.isCompleted,
                      canStop:
                          _controller.isRunning ||
                          _controller.savedProgress > 0,
                      onStart: _startScan,
                      onPause: _controller.pause,
                      onStop: _controller.stop,
                      onFinish: _showInterstitialAd,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
