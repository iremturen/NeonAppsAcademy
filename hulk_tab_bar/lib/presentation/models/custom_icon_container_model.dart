import 'package:flutter/material.dart';

class CustomIconContainerModel {
  final IconData icon;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Color iconColor;
  final double iconSize;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;

  const CustomIconContainerModel({
    required this.icon,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.shadowColor,
    this.width = 160,
    this.height = 160,
    this.borderWidth = 1.5,
    this.iconSize = 64,
    this.shadowBlurRadius = 28,
    this.shadowSpreadRadius = 2,
  });
}