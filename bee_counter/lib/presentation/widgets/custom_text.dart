import 'package:bee_counter/presentation/model/custom_text_model.dart';
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
      style: GoogleFonts.quicksand(
        fontSize: model.fontSize,
        fontWeight: model.fontWeight,
        color: model.color,
      ),
    );
  }
}
