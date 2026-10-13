import 'package:flutter/material.dart';
import 'package:hero_game/app/data/models/custom_image_model.dart';

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
      fit: model.fit,
      width: model.width,
      height: model.height,
    );
  }
}