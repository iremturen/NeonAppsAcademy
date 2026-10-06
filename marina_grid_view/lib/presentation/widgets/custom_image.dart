import 'package:flutter/material.dart';

import 'package:marina_grid_view/presentation/models/custom_image_model.dart';

class CustomImage extends StatelessWidget {
  final CustomImageModel model;

  const CustomImage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: model.borderRadius ?? BorderRadius.zero,
      child: model.isAsset
          ? Image.asset(
              model.image,
              width: model.width,
              height: model.height,
              fit: model.fit,
            )
          : Image.network(
              model.image,
              width: model.width,
              height: model.height,
              fit: model.fit,
            ),
    );
  }
}