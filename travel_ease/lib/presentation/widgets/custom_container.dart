import 'package:flutter/material.dart';

import 'package:travel_ease/presentation/models/custom_container_model.dart';

class CustomContainer extends StatelessWidget {
  final ContainerModel model;
  final Widget? child;
  final VoidCallback? onTap;

  const CustomContainer({
    super.key,
    required this.model,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: model.borderRadius,
      child: Container(
        width: model.width,
        height: model.height,
        padding: model.padding,
        margin: model.margin,
        decoration: BoxDecoration(
          color: model.color,
          borderRadius: model.borderRadius,
          border: model.border,
          boxShadow: model.boxShadow,
        ),
        child: child,
      ),
    );
  }
}