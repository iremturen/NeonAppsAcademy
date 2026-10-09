import 'package:flutter/material.dart';
import 'package:laugh_house/presentation/models/custom_image_model.dart';

class CustomImage extends StatelessWidget {
  final CustomImageModel model;

  const CustomImage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final isUrl =
        model.imagePath.startsWith('http://') ||
        model.imagePath.startsWith('https://');

    if (isUrl) {
      return Image.network(
        model.imagePath,
        width: model.width,
        height: model.height,
        fit: model.fit,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image);
        },
      );
    }

    return Image.asset(
      model.imagePath,
      width: model.width,
      height: model.height,
      fit: model.fit,
      alignment: Alignment.topCenter,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image);
      },
    );
  }
}
