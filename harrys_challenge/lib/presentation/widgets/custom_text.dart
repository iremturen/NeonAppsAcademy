import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:harrys_challenge/presentation/model/text_model.dart';

class CustomText extends StatelessWidget {
  final TextModel textModel;

  const CustomText({
    super.key,
    required this.textModel,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textModel.text,
      textAlign: TextAlign.center,
      style: GoogleFonts.cinzelDecorative(
        fontSize: textModel.fontSize,
        fontWeight: FontWeight.bold,
        color: textModel.color,
        shadows: [
          Shadow(
            color: textModel.color.withValues(alpha: 0.5),
            blurRadius: 12,
          ),
        ],
      ),
    );
  }
}