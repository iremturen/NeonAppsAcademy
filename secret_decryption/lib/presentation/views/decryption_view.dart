import 'package:flutter/material.dart';

import 'package:secret_decryption/constants/colors.dart';
import 'package:secret_decryption/constants/dimensions.dart';
import 'package:secret_decryption/data/helpers/decryption_helper.dart';
import 'package:secret_decryption/presentation/models/custom_button_model.dart';
import 'package:secret_decryption/presentation/models/custom_container_model.dart';
import 'package:secret_decryption/presentation/models/custom_text_model.dart';

import 'package:secret_decryption/presentation/widgets/custom_app_bar.dart';
import 'package:secret_decryption/presentation/widgets/custom_background.dart';
import 'package:secret_decryption/presentation/widgets/custom_button.dart';
import 'package:secret_decryption/presentation/widgets/custom_container.dart';
import 'package:secret_decryption/presentation/widgets/custom_text.dart';

class DecryptionView extends StatefulWidget {
  const DecryptionView({super.key});

  @override
  State<DecryptionView> createState() => _DecryptionViewState();
}

class _DecryptionViewState extends State<DecryptionView> {
  String encryptedMessage = '';

  @override
  void initState() {
    super.initState();

    encryptedMessage = DecryptionHelper.generateEncryptedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomBackground(
        child: Column(
          children: [
            const SizedBox(height: 120),

            CustomText(
              model: CustomTextModel(
                text: 'SYSTEM STATUS: ONLINE',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: red,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            CustomContainer(
              model: CustomContainerModel(
                padding: const EdgeInsets.only(top: 20),
                color: Colors.transparent,
                borderRadius: borderRadius,
                height: containerHeight,
                width: MediaQuery.of(context).size.width * 0.85,
                border: Border.all(color: neonGreen, width: 3),
              ),
              child: Column(
                children: [
                  CustomText(
                    model: CustomTextModel(
                      text: 'INTERCEPTED TRANSMISSION',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: neonGreen,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomText(
                    model: CustomTextModel(
                      text: 'ENCRYPTED MESSAGE',
                      fontSize: containerTitleFontSize,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      color: neonGreen,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    model: CustomTextModel(
                      text: encryptedMessage,
                      fontSize: containerTitleFontSize,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      color: blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            CustomText(
              model: CustomTextModel(
                text: 'AUTHORIZED ACCESS REQUIRED',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: blue,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              model: CustomButtonModel(
                text: 'DECRYPT',
                height: buttonHeight,
                width: MediaQuery.of(context).size.width * 0.85,
                backgroundColor: blue,
                textColor: bg3,
                borderRadius: borderRadius,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            CustomText(
              model: CustomTextModel(
                text: '●  SECURE CONNECTION',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: red,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
