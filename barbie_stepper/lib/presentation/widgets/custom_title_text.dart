import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barbie_stepper/common/constants/colors.dart';

class CustomTitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final Color borderColor;
  final double borderWidth;

  const CustomTitleText({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.color = white,
    this.textAlign = TextAlign.center,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/title_backplate.png',
          width: 460,
          height: 320,
          fit: BoxFit.contain,
        ),

        Transform.translate(
          offset: const Offset(0, -12),
          child: Text(
            text,
            textAlign: textAlign,
            style: GoogleFonts.niconne(
              fontSize: fontSize,
              fontWeight: fontWeight,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = borderWidth
                ..color = borderColor,
            ),
          ),
        ),

        Transform.translate(
          offset: const Offset(0, -12),
          child: Text(
            text,
            textAlign: textAlign,
            style: GoogleFonts.niconne(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.50),
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
