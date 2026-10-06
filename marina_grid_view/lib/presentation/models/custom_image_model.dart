import 'package:flutter/material.dart';

class CustomImageModel {
  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool isAsset;

  const CustomImageModel({
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.isAsset = false,
  });
}