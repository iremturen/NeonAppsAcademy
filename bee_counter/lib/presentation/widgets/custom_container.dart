import 'package:bee_counter/presentation/model/custom_container_model.dart';
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
      padding: model.padding,
      margin: model.margin,
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: model.borderRadius,
      ),
      child: child,
    );
  }
}
