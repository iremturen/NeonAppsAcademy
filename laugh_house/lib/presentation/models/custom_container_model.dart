import 'package:flutter/material.dart';

class CustomContainerModel {
  final double? width;
  final double? height;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const CustomContainerModel({
    this.width,
    this.height,
    required this.color,
    required this.borderRadius,
    this.padding,
    this.margin,
    this.border,
    this.boxShadow,
    this.gradient,
  });
}