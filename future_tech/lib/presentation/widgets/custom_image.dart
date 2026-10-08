import 'package:flutter/material.dart';

import 'package:future_tech/presentation/models/custom_image_model.dart';

class CustomImage extends StatelessWidget {
  final CustomImageModel model;

  const CustomImage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      model.imagePath,
      width: model.width,
      height: model.height,
      fit: model.fit,
    );
  }
}