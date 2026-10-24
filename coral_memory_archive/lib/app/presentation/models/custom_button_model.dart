import 'package:coral_memory_archive/app/common/constants/font_size.dart';
import 'package:coral_memory_archive/app/common/constants/font_weight.dart';
import 'package:flutter/material.dart';

class CustomButtonModel {
  final String text;
  final IconData? icon;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final AppFontSize fontSize;
  final AppFontWeight fontWeight;
  final Color textColor;
  final VoidCallback? onPressed;

  const CustomButtonModel({
    required this.text,
    this.icon,
    this.gradient,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    this.onPressed,
  });
}
