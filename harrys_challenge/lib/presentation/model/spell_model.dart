import 'package:flutter/material.dart';
import 'package:harrys_challenge/presentation/model/text_model.dart';

class SpellModel {
  final TextModel textModel;
  final String imagePath;
  final Color color;
  final Color backgroundImageColor;

  const SpellModel({
    required this.textModel,
    required this.imagePath,
    required this.color,
    this.backgroundImageColor = Colors.transparent,
  });
}
