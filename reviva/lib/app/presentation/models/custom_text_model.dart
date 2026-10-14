import 'dart:ui';

class CustomTextModel {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final double? height;

  const CustomTextModel({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    this.height,
  });
}