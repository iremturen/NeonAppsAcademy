import 'package:flutter/widgets.dart';
import 'package:task_master/app/common/constants/font_size.dart';
import 'package:task_master/app/common/constants/font_weight.dart';

class CustomTextModel {
  final String text;
  final AppFontSize fontSize;
  final AppFontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomTextModel({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    required this.textAlign,
    this.height,
    this.maxLines,
    this.overflow,
  });
}
