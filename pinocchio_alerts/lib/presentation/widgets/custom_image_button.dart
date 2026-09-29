import 'package:flutter/material.dart';
import 'package:pinocchio_alerts/presentation/model/image_button_model.dart';

class CustomImageButton extends StatelessWidget {
  final ImageButtonModel model;

  const CustomImageButton({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      model.imagePath,
      width: model.width,
      height: model.height,
      fit: model.fit,
    );
  }
}
