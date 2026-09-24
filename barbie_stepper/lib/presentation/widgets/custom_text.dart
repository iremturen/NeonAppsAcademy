import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barbie_stepper/common/constants/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.color = white,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.niconne(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}