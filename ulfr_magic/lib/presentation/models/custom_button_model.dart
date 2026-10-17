import 'package:flutter/material.dart';

class CustomButtonModel {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final VoidCallback? onPressed;

  const CustomButtonModel({
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 0,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    this.onPressed,
  });
}