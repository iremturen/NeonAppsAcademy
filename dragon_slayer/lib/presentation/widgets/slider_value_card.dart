import 'package:dragon_slayer/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderValueCard extends StatelessWidget {
  final double value;

  const SliderValueCard({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: softPurple,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: Text(
        value.toInt().toString(),
        style: GoogleFonts.coiny(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}