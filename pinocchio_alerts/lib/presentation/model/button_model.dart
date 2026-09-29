import 'package:flutter/material.dart';

class ButtonModel {
  final String title;
  final VoidCallback onPressed;

  const ButtonModel({
    required this.title,
    required this.onPressed,
  });
}