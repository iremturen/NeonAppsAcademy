import 'package:barbie_stepper/common/constants/colors.dart';
import 'package:barbie_stepper/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final String? imagePath;
  final String text;
  final Color? color;
  final VoidCallback? onTap;

  const CustomImageButton({
    super.key,
    this.imagePath,
    this.color,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
              width: 80,
            ),

          Transform.translate(
            offset: const Offset(0, -8),
            child: CustomText(
              text: text,
              color: color ?? white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}