import 'package:flutter/widgets.dart';

class CustomImageModel {
  final String imagePath;
  final BoxFit fit;
  final double? width;
  final double? height;

  const CustomImageModel({
    required this.imagePath,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
  });
}