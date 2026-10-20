import 'package:flutter/material.dart';

class CustomButtonModel {
  const CustomButtonModel({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
}
