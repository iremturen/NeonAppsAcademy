import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';

class CustomButtonModel {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;

  const CustomButtonModel({
    required this.text,
    required this.onPressed,
    this.backgroundColor = pink,
    this.textColor = bg,
    this.fontSize = buttonFontSize,
    this.fontWeight = FontWeight.bold,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 12,
    ),
  });
}
