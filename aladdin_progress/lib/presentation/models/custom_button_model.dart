import 'package:aladdin_progress/constants/dimensions.dart';
import 'package:flutter/material.dart';

class CustomButtonModel {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color shadowColor;
  final double width;
  final double height;
  final double elevation;
  final double borderRadius;

  const CustomButtonModel({
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.shadowColor = const Color(0x66000000),
    this.width = buttonWidth,
    this.height = buttonHeight,
    this.elevation = 6,
    this.borderRadius = 18,
  });
}
