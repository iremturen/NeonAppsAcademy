import 'package:coral_memory_archive/app/presentation/models/custom_icon_model.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final CustomIconModel model;

  const CustomIcon({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Icon(
      model.icon,
      size: model.size,
      color: model.color,
      semanticLabel: model.semanticLabel,
    );
  }
}
