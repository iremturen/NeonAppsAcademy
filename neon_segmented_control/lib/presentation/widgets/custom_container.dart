import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:neon_segmented_control/data/model/custom_container_model.dart';

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
      margin: model.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(model.borderRadius),
        boxShadow: [
          BoxShadow(
            color: model.shadowColor,
            blurRadius: model.shadowBlur,
            spreadRadius: model.shadowSpread,
            offset: model.shadowOffset,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(model.borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: model.blur,
            sigmaY: model.blur,
          ),
          child: Container(
            padding: model.padding,
            decoration: BoxDecoration(
              color: model.backgroundColor,
              borderRadius: BorderRadius.circular(model.borderRadius),
              border: Border.all(
                color: model.borderColor,
                width: model.borderWidth,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}