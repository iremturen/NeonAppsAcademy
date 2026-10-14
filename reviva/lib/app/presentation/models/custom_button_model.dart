
import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';

class CustomButtonModel {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final AppFontSize? fontSize;
  final AppFontWeight fontWeight;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;

  const CustomButtonModel({
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight = AppFontWeight.normal,
    this.borderRadius = AppDimensions.buttonBorderRadius,
    this.borderColor = AppColors.transparent,
    this.borderWidth = AppDimensions.buttonBorder,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppDimensions.buttonPaddingHorizontal,
      vertical: AppDimensions.buttonPaddingVertical,
    ),
  });
}
