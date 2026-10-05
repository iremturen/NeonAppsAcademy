import 'package:flutter/material.dart';
import 'package:search_bar_challenge/constants/colors.dart';

class CustomTextModel {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const CustomTextModel({
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.color = black,
    this.textAlign = TextAlign.center,
  });
}