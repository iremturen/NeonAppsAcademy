import 'package:flutter/material.dart';

class CustomImageModel {
  final ImageProvider image;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const CustomImageModel({
    required this.image,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });
}