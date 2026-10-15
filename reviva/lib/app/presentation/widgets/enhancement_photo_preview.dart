import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/images.dart';
import 'package:reviva/app/common/widgets/custom_image.dart';
import 'package:reviva/app/presentation/models/custom_image_model.dart';

class EnhancementPhotoPreview extends StatelessWidget {
  final File imageFile;
  final AnimationController controller;
  final bool isRunning;

  const EnhancementPhotoPreview({
    super.key,
    required this.imageFile,
    required this.controller,
    required this.isRunning,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        AppDimensions.borderRadius,
      ),
      child: AspectRatio(
        aspectRatio: AppDimensions.imageAspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomImage(
              model: CustomImageModel(
                imageFile: imageFile,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: Opacity(
                  opacity: isRunning ? 1 : 0,
                  child: Lottie.asset(
                    AppImages.photoScanner,
                    controller: controller,
                    fit: BoxFit.contain,
                    onLoaded: (composition) {
                      controller.duration ??= composition.duration;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}