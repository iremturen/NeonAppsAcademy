import 'package:flutter/material.dart';
import 'package:tony_scroll_view/common/constants/dimensions.dart';
import 'package:tony_scroll_view/presentation/model/custom_container_model.dart';

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
        border: model.border,
        boxShadow: model.boxShadow,
      ),
      child: Row(
        children: [
          if (model.imagePath != null) ...[
            Image.asset(
              model.imagePath!,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 24),
          ],
          Expanded(
            child: child ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}