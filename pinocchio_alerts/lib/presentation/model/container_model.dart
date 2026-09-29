import 'package:flutter/material.dart';

class ContainerModel {
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  const ContainerModel({
    this.width,
    this.height,
    this.color,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.boxShadow,
  });
}