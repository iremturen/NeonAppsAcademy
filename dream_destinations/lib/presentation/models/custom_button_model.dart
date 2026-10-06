import 'package:flutter/material.dart';

class CustomButtonModel {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;

  const CustomButtonModel({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.borderRadius,
  });
}