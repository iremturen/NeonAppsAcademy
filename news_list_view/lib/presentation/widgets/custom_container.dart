import 'package:flutter/material.dart';

import 'package:news_list_view/presentation/models/custom_container_model.dart';

class CustomContainer extends StatelessWidget {
  final CustomContainerModel model;
  final Widget child;

  const CustomContainer({
    super.key,
    required this.model,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: model.width,
      height: model.height,
      padding: model.padding,
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.circular(model.borderRadius),
        boxShadow: model.boxShadow,
      ),
      child: child,
    );
  }
}