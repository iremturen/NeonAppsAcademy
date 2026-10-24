import 'package:flutter/material.dart';

class CustomTextFieldModel {
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextFieldModel({
    required this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.onChanged,
  });
}
