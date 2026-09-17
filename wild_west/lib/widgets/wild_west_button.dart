import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class WildWestButton extends StatelessWidget{
  final String text;
  final VoidCallback? onPressed;

  const WildWestButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            saddleBrown,
            darkLeather,
            dustyLeather,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: westernGold,
          width: 3,
        ),
        boxShadow: const [
          BoxShadow(
            color: darkShadow,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: parchment,
          shadowColor: Colors.transparent,
          elevation: 0,
          minimumSize: const Size(300, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}