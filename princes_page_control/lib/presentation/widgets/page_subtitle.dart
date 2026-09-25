import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageSubtitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const PageSubtitle({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.storyScript(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}