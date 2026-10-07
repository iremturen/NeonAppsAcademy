import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_decryption/presentation/models/custom_text_model.dart';

class CustomText extends StatelessWidget {
  final CustomTextModel model;

  const CustomText({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      model.text,
      style: GoogleFonts.orbitron(
        fontSize: model.fontSize,
        fontWeight: model.fontWeight,
        color: model.color,
      ),
      textAlign: model.textAlign,
    );
  }
}
