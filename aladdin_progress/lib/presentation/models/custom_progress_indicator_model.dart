import 'dart:ui';

class CustomProgressIndicatorModel {
  final double value;
  final Color color;
  final Color backgroundColor;
  final double minHeight;

  const CustomProgressIndicatorModel({
    required this.value,
    required this.color,
    required this.backgroundColor,
    required this.minHeight,
  });
}