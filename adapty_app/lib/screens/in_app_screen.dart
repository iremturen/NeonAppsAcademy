import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:flutter/material.dart';
import 'package:adapty_ui_flutter/adapty_ui_flutter.dart';
import 'main_screen.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../models/custom_button_model.dart';
import '../models/custom_text_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class InAppScreen extends StatefulWidget {
  const InAppScreen({super.key});

  @override
  State<InAppScreen> createState() => _InAppScreenState();
}

class _InAppScreenState extends State<InAppScreen> {
  AdaptyPaywallProduct? _product;
  bool _isLoading = true;
  bool _isProcessing = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    try {
      final paywall = await Adapty().getPaywall(placementId: 'main_paywall');

      final products = await Adapty().getPaywallProducts(paywall: paywall);

      if (!mounted) return;

      setState(() {
        _product = products.isNotEmpty ? products.first : null;
        _isLoading = false;
        _errorMessage = _product == null
            ? AppStrings.productUnavailable
            : null;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _product = null;
        _isLoading = false;
        _errorMessage = AppStrings.productUnavailable;
      });

      debugPrint('Product loading failed: $e');
    }
  }

  Future<void> _buyProduct() async {
    final product = _product;

    if (product == null || _isProcessing) return;

    setState(() {
      _isProcessing = true;
      _errorMessage = null;
    });

    try {
      final profile = await Adapty().makePurchase(product: product);

      if (!mounted) return;

      if (profile?.accessLevels['premium']?.isActive == true) {
        _showPaymentCompleted();
      } else {
        setState(() {
          _errorMessage = AppStrings.paymentNotMade;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage = AppStrings.paymentNotMade;
      });

      debugPrint('Purchase failed: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  Future<void> _restorePurchases() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
      _errorMessage = null;
    });

    try {
      final profile = await Adapty().restorePurchases();

      if (!mounted) return;

      if (profile.accessLevels['premium']?.isActive == true) {
        _showPaymentCompleted();
      } else {
        setState(() {
          _errorMessage = AppStrings.noActiveSubscription;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage = AppStrings.restoreFailed;
      });

      debugPrint('Restore failed: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  void _showPaymentCompleted() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
            side: const BorderSide(color: AppColors.border),
          ),
          contentPadding: const EdgeInsets.fromLTRB(
            AppDimensions.screenPadding,
            AppDimensions.dialogTopPadding,
            AppDimensions.screenPadding,
            AppDimensions.compactPadding,
          ),
          actionsPadding: const EdgeInsets.fromLTRB(
            AppDimensions.screenPadding,
            AppDimensions.compactPadding,
            AppDimensions.screenPadding,
            AppDimensions.screenPadding,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: AppDimensions.dialogIconContainerSize,
                height: AppDimensions.dialogIconContainerSize,
                decoration: BoxDecoration(
                  color: AppColors.primaryTint,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: AppColors.primary,
                  size: AppDimensions.dialogIconSize,
                ),
              ),
              CustomText(
                model: CustomTextModel(
                  text: AppStrings.paymentCompleted,
                  fontSize: AppDimensions.dialogTitleFontSize,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  textAlign: TextAlign.center,
                ),
              ),
              CustomText(
                model: CustomTextModel(
                  text: AppStrings.paymentCompletedMessage,
                  color: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                );
              },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(AppDimensions.buttonHeight),
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
                  ),
                  elevation: 0,
                ),
                child: CustomText(
                  model: CustomTextModel(
                    text: AppStrings.continueLabel,
                    fontWeight: FontWeight.w600,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.screenPadding),
            child: _isLoading
                ? const CircularProgressIndicator(color: AppColors.primary)
                : Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: AppDimensions.cardMaxWidth),
                    padding: const EdgeInsets.all(AppDimensions.screenPadding),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
                      border: Border.all(color: AppColors.border),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x66000000),
                          blurRadius: AppDimensions.cardShadowBlurRadius,
                          offset: Offset(0, AppDimensions.cardShadowOffsetY),
                        ),
                      ],
                    ),
                    child: Column(
                      spacing: AppDimensions.largeSpacing,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          model: CustomTextModel(
                            text: AppStrings.premiumTitle,
                            fontSize: AppDimensions.sectionTitleFontSize,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Container(
                          width: AppDimensions.paywallIconContainerSize,
                          height: AppDimensions.paywallIconContainerSize,
                          decoration: BoxDecoration(
                            color: AppColors.primaryTint,
                            borderRadius: BorderRadius.circular(AppDimensions.iconTileRadius),
                          ),
                          child: const Icon(
                            Icons.workspace_premium_rounded,
                            color: AppColors.primary,
                            size: AppDimensions.paywallIconSize,
                          ),
                        ),
                        CustomText(
                          model: CustomTextModel(
                            text: _product?.price.localizedString ?? AppStrings.fallbackPrice,
                            fontSize: AppDimensions.priceFontSize,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CustomText(
                          model: CustomTextModel(
                            text: AppStrings.perMonthPrice,
                            fontSize: AppDimensions.bodyFontSize,
                            color: AppColors.textSecondary,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (_errorMessage != null) ...[
                          CustomText(
                            model: CustomTextModel(
                              text: _errorMessage!,
                              color: AppColors.error,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        CustomButton(
                          model: CustomButtonModel(
                            onPressed: _isProcessing || _product == null
                                ? null
                                : _buyProduct,
                            isLoading: _isProcessing,
                            label: AppStrings.buy,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: _isProcessing ? null : _restorePurchases,
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(AppDimensions.buttonHeight),
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(color: AppColors.border),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
                              ),
                            ),
                            child: CustomText(
                              model: CustomTextModel(
                                text: AppStrings.restorePurchase,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _showPaymentCompleted,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                          child: CustomText(
                            model: CustomTextModel(
                              text: AppStrings.testSuccessfulPurchase,
                              fontSize: AppDimensions.captionFontSize,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _errorMessage = AppStrings.paymentNotMade;
                            });
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                          child: CustomText(
                            model: CustomTextModel(
                              text: AppStrings.testFailedPurchase,
                              fontSize: AppDimensions.captionFontSize,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
