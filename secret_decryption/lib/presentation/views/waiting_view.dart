import 'dart:async';

import 'package:flutter/material.dart';

import 'package:secret_decryption/constants/colors.dart';
import 'package:secret_decryption/constants/dimensions.dart';
import 'package:secret_decryption/data/helpers/notification_helper.dart';
import 'package:secret_decryption/presentation/models/custom_container_model.dart';
import 'package:secret_decryption/presentation/models/custom_text_model.dart';
import 'package:secret_decryption/presentation/widgets/custom_app_bar.dart';
import 'package:secret_decryption/presentation/widgets/custom_background.dart';
import 'package:secret_decryption/presentation/widgets/custom_container.dart';
import 'package:secret_decryption/presentation/widgets/custom_text.dart';

class WaitingView extends StatefulWidget {
  const WaitingView({super.key});

  @override
  State<WaitingView> createState() => _WaitingViewState();
}

class _WaitingViewState extends State<WaitingView> {
  int remainingSeconds = 15;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        NotificationHelper.showSecurityCode('DECRYPTION COMPLETED');
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomBackground(
        child: Center(
          child: CustomContainer(
            model: CustomContainerModel(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.all(24),
              color: Colors.transparent,
              borderRadius: borderRadius,
              border: Border.all(color: blue, width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  model: CustomTextModel(
                    text: 'DECRYPTION IN PROGRESS',
                    fontSize: containerTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: blue,
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 30),

                CustomText(
                  model: CustomTextModel(
                    text: '$remainingSeconds',
                    fontSize: timerFontSize,
                    fontWeight: FontWeight.bold,
                    color: neonGreen,
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 12),

                CustomText(
                  model: CustomTextModel(
                    text: 'SECONDS REMAINING',
                    fontSize: appBarSubtitleFontSize,
                    fontWeight: FontWeight.w500,
                    color: neonGreen.withValues(alpha: 0.7),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 30),

                CustomText(
                  model: CustomTextModel(
                    text: 'DECRYPTION SOFTWARE ACTIVE...',
                    fontSize: appBarSubtitleFontSize,
                    fontWeight: FontWeight.w500,
                    color: red,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
