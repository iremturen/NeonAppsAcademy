import 'package:flutter/material.dart';
import 'package:hero_game/app/common/constants/images.dart';
import 'package:hero_game/app/common/widgets/custom_image.dart';
import 'package:hero_game/app/presentation/models/custom_image_model.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomImage(
        model: CustomImageModel(
          imagePath: AppImages.mazeBackground,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
