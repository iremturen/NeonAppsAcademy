import 'package:flutter/material.dart';

class CustomImageModel {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double borderRadius;

  const CustomImageModel({
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
    required this.borderRadius,
  });
}