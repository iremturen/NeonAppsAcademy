import 'package:dream_destinations/presentation/models/custom_container_model.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final CustomContainerModel model;
  final Widget? child;

  const CustomContainer({
    super.key,
    required this.model,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: model.width,
      height: model.height,
      margin: model.margin,
      padding: model.padding,
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.circular(
          model.borderRadius,
        ),
        border: model.border,
        boxShadow: model.boxShadow,
      ),
      child: child,
    );
  }
}