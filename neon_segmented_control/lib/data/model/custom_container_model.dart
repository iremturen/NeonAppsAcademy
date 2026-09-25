import 'package:flutter/material.dart';

class CustomContainerModel {
  final double height;
  final double width;
  final Color backgroundColor;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final double blur;
  final Color shadowColor;
  final double shadowBlur;
  final Offset shadowOffset;
  final double shadowSpread;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const CustomContainerModel({
    this.height = 200,
    this.width = 400,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 20,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.blur = 0,
    this.shadowColor = Colors.transparent,
    this.shadowBlur = 0,
    this.shadowOffset = Offset.zero,
    this.shadowSpread = 0,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });
}