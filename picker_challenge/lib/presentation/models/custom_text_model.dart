import 'package:flutter/material.dart';

class CustomTextModel {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final String? fontFamily;


  const CustomTextModel({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.textAlign = TextAlign.start,
    this.fontFamily,
  });
}