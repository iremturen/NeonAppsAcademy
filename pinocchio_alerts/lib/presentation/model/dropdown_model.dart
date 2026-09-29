import 'package:flutter/material.dart';

class DropdownModel {
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const DropdownModel({
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  });
}