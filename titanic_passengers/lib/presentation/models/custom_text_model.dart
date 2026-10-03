import 'package:flutter/material.dart';

class TextModel {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const TextModel({
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.center,
  });
}