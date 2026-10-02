import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/presentation/models/custom_icon_container_model.dart';

class CustomIconContainer extends StatelessWidget {
  final CustomIconContainerModel model;

  const CustomIconContainer({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: model.width,
      height: model.height,
      decoration: BoxDecoration(
        color: model.backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: model.borderColor,
          width: model.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: model.shadowColor,
            blurRadius: model.shadowBlurRadius,
            spreadRadius: model.shadowSpreadRadius,
          ),
        ],
      ),
      child: Icon(
        model.icon,
        color: model.iconColor,
        size: model.iconSize,
      ),
    );
  }
}