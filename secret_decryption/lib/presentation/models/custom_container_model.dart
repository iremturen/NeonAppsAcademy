import 'package:flutter/material.dart';

class CustomContainerModel {
  final double? width;
  final double? height;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const CustomContainerModel({
    required this.color,
    required this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.border,
    this.boxShadow,
  });
}
