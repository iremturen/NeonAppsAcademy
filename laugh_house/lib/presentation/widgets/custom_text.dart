import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';

class CustomText extends StatelessWidget {
  final CustomTextModel model;

  const CustomText({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      model.text,
      textAlign: model.textAlign,
      style: GoogleFonts.azeretMono(
        fontSize: model.fontSize,
        fontWeight: model.fontWeight,
        color: model.color,
        height: model.height,
      ),
    );
  }
}