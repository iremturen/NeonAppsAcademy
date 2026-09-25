import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neon_segmented_control/data/model/custom_text_model.dart';

class CustomText extends StatelessWidget {
  final CustomTextModel model;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.model,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      model.text,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.nunito(
        fontSize: model.fontSize,
        fontWeight: model.fontWeight,
        color: model.color,
      ),
    );
  }
}