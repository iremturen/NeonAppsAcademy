import 'package:flutter/material.dart';
import 'package:travel_ease/presentation/models/custom_image_model.dart';

class CustomImage extends StatelessWidget {
  final ImageModel model;

  const CustomImage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: model.borderRadius ?? BorderRadius.zero,
      child: Image.network(
        model.imageUrl,
        width: model.width,
        height: model.height,
        fit: model.fit,
      ),
    );
  }
}