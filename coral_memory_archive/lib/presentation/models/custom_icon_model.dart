import 'package:flutter/material.dart';

class CustomIconModel {
  final IconData icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;

  const CustomIconModel({
    required this.icon,
    this.size,
    this.color,
    this.semanticLabel,
  });
}
