import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class WildWestText extends StatelessWidget {
    final String text;
    final double fontSize;

    const WildWestText({
      super.key,
      required this.text,
      this.fontSize = 55,
    });

    @override
    Widget build(BuildContext context) {
      return Text(
        text,
        style: GoogleFonts.rye(
          color: desertSand,
          fontSize: fontSize,
          fontWeight: FontWeight.w200,
          shadows: const [
            Shadow(
              color: darkShadow,
              blurRadius: 8,
              offset: Offset(2, 3),
            ),
          ],
        ),
      );
  }
}