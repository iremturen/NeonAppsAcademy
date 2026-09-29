import 'package:bee_counter/common/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonModel {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color shadowColor;
  final double? width;
  final double height;
  final double elevation;
  final double borderRadius;

  const CustomButtonModel({
    required this.text,
    required this.onPressed,
    this.backgroundColor = yellow,
    this.foregroundColor = black,
    this.shadowColor = const Color(0x66000000),
    this.width,
    this.height = 52,
    this.elevation = 6,
    this.borderRadius = 16,
  });
}
