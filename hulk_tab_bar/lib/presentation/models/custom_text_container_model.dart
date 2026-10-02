import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_model.dart';

class CustomTextContainerModel {
  final CustomTextModel title;
  final CustomTextModel subtitle;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  const CustomTextContainerModel({
    required this.title,
    required this.subtitle,
    this.backgroundColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
  });
}