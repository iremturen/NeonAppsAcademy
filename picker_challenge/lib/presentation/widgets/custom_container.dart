import 'package:flutter/material.dart';
import 'package:picker_challenge/presentation/models/custom_container_model.dart';

class CustomContainer extends StatelessWidget {
  final CustomContainerModel model;
  final Widget? child;

  const CustomContainer({super.key, required this.model, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: model.width,
      height: model.height,
      decoration: BoxDecoration(
        color: model.color,
        shape: model.shape,
        border: model.border,
        borderRadius: model.borderRadius,
      ),
      child: child,
    );
  }
}
