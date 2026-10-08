import 'package:flutter/material.dart';

import 'package:secret_decryption/constants/colors.dart';
import 'package:secret_decryption/constants/dimensions.dart';
import 'package:secret_decryption/presentation/models/custom_button_model.dart';
import 'package:secret_decryption/presentation/models/custom_container_model.dart';
import 'package:secret_decryption/presentation/models/custom_text_model.dart';
import 'package:secret_decryption/presentation/widgets/custom_button.dart';
import 'package:secret_decryption/presentation/widgets/custom_container.dart';
import 'package:secret_decryption/presentation/widgets/custom_text.dart';

class CustomSecurityCode extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const CustomSecurityCode({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(20),
        color: Colors.transparent,
        borderRadius: borderRadius,
      ),
      child: Column(
        children: [
          CustomText(
            model: CustomTextModel(
              text: 'ENTER SECURITY CODE',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: blue,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: blue,
              fontSize: appBarSubtitleFontSize,
            ),
            decoration: InputDecoration(
              hintText: 'SECURITY CODE',
              hintStyle: TextStyle(
                color: neonGreen.withValues(alpha: 0.4),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: neonGreen,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: neonGreen,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            model: CustomButtonModel(
              text: 'CONFIRM',
              height: buttonHeight,
              width: double.infinity,
              backgroundColor: neonGreen,
              textColor: bg2,
              borderRadius: borderRadius,
              fontWeight: FontWeight.bold,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}