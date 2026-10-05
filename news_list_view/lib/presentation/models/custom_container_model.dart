import 'package:flutter/material.dart';

class CustomContainerModel {
  final double? width;
  final double? height;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  final List<BoxShadow>? boxShadow;

  const CustomContainerModel({
    this.width,
    this.height,
    this.color = Colors.transparent,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.all(12),
    this.boxShadow,
  });
}