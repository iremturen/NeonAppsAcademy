import 'package:flutter/material.dart';

import 'package:harrys_challenge/presentation/model/image_model.dart';

class CustomImage extends StatelessWidget {
  final ImageModel imageModel;

  const CustomImage({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageModel.imagePath,
      width: imageModel.width,
      height: imageModel.height,
      color: imageModel.color?.withValues(alpha: 0.25),
      colorBlendMode: imageModel.color != null ? BlendMode.srcATop : null,
      fit: imageModel.fit,
    );
  }
}
