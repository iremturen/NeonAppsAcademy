import 'package:flutter/material.dart';

class CustomContainerModel {
  final double width;
  final double height;
  final Color color;
  final BoxShape shape;
  final BoxBorder? border;
  final BorderRadius? borderRadius;

  const CustomContainerModel({
    required this.width,
    required this.height,
    required this.color,
    this.shape = BoxShape.rectangle,
    this.border,
    this.borderRadius,
  });
}
