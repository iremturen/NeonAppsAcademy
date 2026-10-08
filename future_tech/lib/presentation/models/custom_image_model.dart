import 'package:flutter/material.dart';

class CustomImageModel {
  final String imagePath;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomImageModel({
    required this.imagePath,
    required this.width,
    required this.height,
    required this.fit,
  });
}