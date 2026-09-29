import 'package:bee_counter/common/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextModel {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomTextModel({
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.color = black,
  });
}
