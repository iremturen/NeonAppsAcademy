import 'package:flutter/material.dart';

class TextModel {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final TextAlign? textAlign;

  const TextModel({
    required this.text,
    required this.fontSize,
    this.fontWeight,
    required this.color,
    this.textAlign,
  });
}