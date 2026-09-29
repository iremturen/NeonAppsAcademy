import 'package:flutter/material.dart';
import 'package:pinocchio_alerts/presentation/model/container_model.dart';

class CustomContainer extends StatelessWidget {
  final ContainerModel model;
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
      color: model.border == null ? model.color : null,
      padding: model.padding,
      margin: model.margin,
      decoration: model.border != null ||
              model.borderRadius != null ||
              model.boxShadow != null
          ? BoxDecoration(
              color: model.color,
              borderRadius: model.borderRadius,
              border: model.border,
              boxShadow: model.boxShadow,
            )
          : null,
      child: child,
    );
  }
}