import 'dart:io';

import 'package:flutter/widgets.dart';

class CustomImageModel {
  final String? imagePath;
  final File? imageFile;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double? borderRadius;

  const CustomImageModel({
    this.imagePath,
    this.imageFile,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
  });
}