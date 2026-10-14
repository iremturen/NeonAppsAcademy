import 'package:flutter/material.dart';

enum AppFontWeight {
  normal(FontWeight.normal),
  medium(FontWeight.w500),
  bold(FontWeight.bold);

  final FontWeight value;
  const AppFontWeight(this.value);
}