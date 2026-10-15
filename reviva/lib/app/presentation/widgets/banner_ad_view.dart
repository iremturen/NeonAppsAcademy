import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:reviva/app/presentation/controller/ad_controller.dart';

class BannerAdView extends StatefulWidget {
  final AdController adController;

  const BannerAdView({
    super.key,
    required this.adController,
  });

  @override
  State<BannerAdView> createState() => _BannerAdViewState();
}

class _BannerAdViewState extends State<BannerAdView> {
  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    widget.adController.loadBannerAd(
      onUpdate: () {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BannerAd? bannerAd = widget.adController.bannerAd;

    if (bannerAd == null) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      top: false,
      child: SizedBox(
        width: bannerAd.size.width.toDouble(),
        height: bannerAd.size.height.toDouble(),
        child: AdWidget(ad: bannerAd),
      ),
    );
  }
}