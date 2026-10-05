import 'package:flutter/material.dart';
import 'package:news_list_view/presentation/models/custom_image_model.dart';

class CustomImage extends StatelessWidget {
  final CustomImageModel model;

  const CustomImage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final image = model.imagePath.startsWith('http')
        ? Image.network(
            model.imagePath,
            width: model.width,
            height: model.height,
            fit: model.fit,
          )
        : Image.asset(
            model.imagePath,
            width: model.width,
            height: model.height,
            fit: model.fit,
          );

    return image;
  }
}
