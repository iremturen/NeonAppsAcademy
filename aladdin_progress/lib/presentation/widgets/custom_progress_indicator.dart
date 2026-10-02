import 'package:aladdin_progress/constants/dimensions.dart';
import 'package:aladdin_progress/presentation/models/custom_progress_indicator_model.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final CustomProgressIndicatorModel model;

  const CustomProgressIndicator({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: model.value,
      color: model.color,
      backgroundColor: model.backgroundColor,
      minHeight: model.minHeight,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}