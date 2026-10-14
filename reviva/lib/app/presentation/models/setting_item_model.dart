import 'package:flutter/material.dart';

class SettingItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingItemModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}