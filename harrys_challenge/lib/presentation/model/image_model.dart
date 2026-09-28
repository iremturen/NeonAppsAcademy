import 'package:flutter/material.dart';

class ImageModel {
  final String imagePath;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageModel({
    required this.imagePath,
    this.color,
    this.width,
    this.height,
    this.fit,
  });
}