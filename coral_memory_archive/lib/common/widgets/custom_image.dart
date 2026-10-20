import 'dart:convert';

import 'package:coral_memory_archive/presentation/models/custom_image_model.dart';
import 'package:coral_memory_archive/common/widgets/custom_icon.dart';
import 'package:coral_memory_archive/common/widgets/local_file_image.dart';
import 'package:coral_memory_archive/presentation/models/custom_icon_model.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final CustomImageModel model;

  const CustomImage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if (model.imageUrl.isEmpty) {
      return _buildPlaceholder();
    }

    final uri = Uri.tryParse(model.imageUrl);
    final isRemoteImage =
        uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
    if (isRemoteImage) {
      return Image.network(
        model.imageUrl,
        width: model.width,
        height: model.height,
        fit: model.fit,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    if (uri?.scheme == 'data') {
      final encodedImage = model.imageUrl.split(',').last;
      return Image.memory(
        base64Decode(encodedImage),
        width: model.width,
        height: model.height,
        fit: model.fit,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    return localFileImage(
      path: model.imageUrl,
      width: model.width,
      height: model.height,
      fit: model.fit,
      errorBuilder: _buildPlaceholder,
    );
  }

  Widget _buildPlaceholder() {
    return SizedBox(
      width: model.width,
      height: model.height,
      child: Center(
        child:
            model.placeholder ??
            const CustomIcon(
              model: CustomIconModel(icon: Icons.broken_image_outlined),
            ),
      ),
    );
  }
}
