import 'package:flutter/material.dart';
import 'package:neon_segmented_control/common/constants/colors.dart';

class SegmentedControlModel {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Color shadowColor;
  final double shadowBlur;
  final Offset shadowOffset;
  final double shadowSpread;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const SegmentedControlModel({
    required this.title,
    required this.backgroundColor,
    this.textColor = white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.borderRadius = 16,
    this.shadowColor = Colors.transparent,
    this.shadowBlur = 0,
    this.shadowOffset = Offset.zero,
    this.shadowSpread = 0,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });
}