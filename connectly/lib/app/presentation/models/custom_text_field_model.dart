import 'package:flutter/material.dart';

class CustomTextFieldModel {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextFieldModel({
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.validator,
    this.onChanged,
  });
}