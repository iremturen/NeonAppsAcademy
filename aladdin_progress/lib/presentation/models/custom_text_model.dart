import 'package:aladdin_progress/constants/colors.dart';
import 'package:aladdin_progress/constants/dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextModel {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomTextModel({
    required this.text,
    this.fontSize = subtitleFontSize,
    this.fontWeight = FontWeight.bold,
    this.color = white,
  });
}
