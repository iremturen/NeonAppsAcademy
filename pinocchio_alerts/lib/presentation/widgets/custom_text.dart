import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/text_model.dart';

class CustomText extends StatelessWidget {
  final TextModel model;

  const CustomText({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      model.text,
      textAlign: model.textAlign,
      style: GoogleFonts.margarine(
        fontSize: model.fontSize,
        fontWeight: model.fontWeight,
        color: model.color,
      ),
    );
  }
}