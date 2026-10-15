import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdController {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  bool _isRewardedLoading = false;
  bool _isBannerLoading = false;
  bool _isInterstitialLoading = false;

  BannerAd? get bannerAd => _bannerAd;

  bool get isBannerReady => _bannerAd != null;

  bool get isInterstitialReady => _interstitialAd != null;

  String get _bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }

    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2435281174';
    }

    return '';
  }

  String get _rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    }

    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    }

    return '';
  }

  String get _interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }

    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    }

    return '';
  }

  void loadBannerAd({required VoidCallback onUpdate}) {
    if (_bannerAd != null || _isBannerLoading) return;
    if (!Platform.isAndroid && !Platform.isIOS) return;

    _isBannerLoading = true;

    final bannerAd = BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _isBannerLoading = false;
          _bannerAd = ad as BannerAd;
          onUpdate();
        },
        onAdFailedToLoad: (ad, error) {
          _isBannerLoading = false;
          ad.dispose();
          debugPrint('Banner reklamı yüklenemedi: $error');
          onUpdate();
        },
      ),
    );

    bannerAd.load();
  }

  void loadInterstitialAd() {
    if (_interstitialAd != null || _isInterstitialLoading) return;
    if (!Platform.isAndroid && !Platform.isIOS) return;

    _isInterstitialLoading = true;

    InterstitialAd.load(
      adUnitId: _interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _isInterstitialLoading = false;
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          _isInterstitialLoading = false;
          _interstitialAd = null;
          debugPrint('Interstitial reklamı yüklenemedi: $error');
        },
      ),
    );
  }

  void loadRewardedAd() {
    if (_rewardedAd != null || _isRewardedLoading) return;
    if (!Platform.isAndroid && !Platform.isIOS) return;

    _isRewardedLoading = true;

    RewardedAd.load(
      adUnitId: _rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _isRewardedLoading = false;
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          _isRewardedLoading = false;
          _rewardedAd = null;
          debugPrint('Rewarded reklam yüklenemedi: $error');
        },
      ),
    );
  }

  void showInterstitialAd({required VoidCallback onAdDismissed}) {
    final ad = _interstitialAd;

    if (ad == null) {
      onAdDismissed();
      loadInterstitialAd();
      return;
    }

    _interstitialAd = null;

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        onAdDismissed();
        loadInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        debugPrint('Interstitial reklamı gösterilemedi: $error');
        onAdDismissed();
        loadInterstitialAd();
      },
    );

    ad.show();
  }

  void showRewardedAd({
    required VoidCallback onRewardEarned,
    required VoidCallback onAdUnavailable,
  }) {
    final ad = _rewardedAd;

    if (ad == null) {
      onAdUnavailable();
      loadRewardedAd();
      return;
    }

    _rewardedAd = null;

    bool rewardEarned = false;

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();

        if (!rewardEarned) {
          // Kullanıcı reklamı ödül kazanmadan kapattı.
        }

        loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        debugPrint('Rewarded reklam gösterilemedi: $error');
        loadRewardedAd();
      },
    );

    ad.show(
      onUserEarnedReward: (ad, reward) {
        rewardEarned = true;
        onRewardEarned();
      },
    );
  }

  void disposeBannerAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  void dispose() {
    _bannerAd?.dispose();
    _bannerAd = null;

    _interstitialAd?.dispose();
    _interstitialAd = null;

    _rewardedAd?.dispose();
    _rewardedAd = null;
  }
}
