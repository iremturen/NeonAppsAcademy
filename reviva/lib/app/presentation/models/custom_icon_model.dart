import 'package:flutter/material.dart';

class CustomIconModel {
  final IconData icon;
  final double? size;
  final Color? color;

  const CustomIconModel({
    required this.icon,
    this.size,
    this.color,
  });
}