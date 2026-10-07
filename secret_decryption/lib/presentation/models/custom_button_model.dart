import 'package:flutter/material.dart';

class CustomButtonModel {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double borderRadius;
  final double? width;
  final double? height;

  const CustomButtonModel({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize,
    this.fontWeight,
    required this.borderRadius,
    this.height,
    this.width,
  });
}
