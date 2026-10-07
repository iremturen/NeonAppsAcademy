import 'package:flutter/material.dart';

class ContainerModel {
  final double? width;
  final double? height;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  const ContainerModel({
    this.width,
    this.height,
    this.color = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    this.padding,
    this.margin,
    this.border,
    this.boxShadow,
  });
}