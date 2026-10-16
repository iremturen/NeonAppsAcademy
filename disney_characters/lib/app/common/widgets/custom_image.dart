import 'package:disney_characters/app/presentation/models/custom_image_model.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final CustomImageModel model;

  const CustomImage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    if (model.imageFile != null) {
      return Image.file(
        model.imageFile!,
        fit: model.fit,
        width: model.width,
        height: model.height,
      );
    }

    if (model.imagePath != null) {
      return Image.network(
        model.imagePath!,
        fit: model.fit,
        width: model.width,
        height: model.height,
      );
    }

    return const SizedBox.shrink();
  }
}