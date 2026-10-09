import 'package:flutter/material.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';

class CustomContainer extends StatelessWidget {
  final CustomContainerModel model;
  final Widget? child;

  const CustomContainer({super.key, required this.model, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: model.width,
      height: model.height,
      padding: model.padding,
      margin: model.margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: model.color,
        gradient: model.gradient,
        borderRadius: BorderRadius.circular(model.borderRadius),
        border: model.border,
        boxShadow: model.boxShadow,
      ),
      child: child,
    );
  }
}
