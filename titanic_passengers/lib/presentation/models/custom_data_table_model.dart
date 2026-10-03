import 'package:flutter/material.dart';

class CustomDataTableModel {
  final Color headingRowColor;
  final Color dataRowColor;
  final Color borderColor;
  final double headingRowHeight;
  final double dataRowHeight;
  final double horizontalMargin;
  final double columnSpacing;

  const CustomDataTableModel({
    this.headingRowColor = Colors.transparent,
    this.dataRowColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.headingRowHeight = 56,
    this.dataRowHeight = 48,
    this.horizontalMargin = 24,
    this.columnSpacing = 24,
  });
}