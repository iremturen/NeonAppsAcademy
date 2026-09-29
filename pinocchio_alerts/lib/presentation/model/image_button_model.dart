import 'package:flutter/material.dart';

class ImageButtonModel {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageButtonModel({
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
  });
}
