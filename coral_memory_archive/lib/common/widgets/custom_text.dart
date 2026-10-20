import 'package:coral_memory_archive/presentation/models/custom_text_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      maxLines: model.maxLines,
      overflow: model.overflow,
      style: GoogleFonts.nunito(
        fontSize: model.fontSize.value,
        fontWeight: model.fontWeight.value,
        color: model.color,
        height: model.height,
      ),
    );
  }
}
