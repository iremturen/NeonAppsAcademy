import 'package:flutter/material.dart';

class PageImage extends StatelessWidget {
  final String imagePath;
  final double width;

  const PageImage({
    super.key,
    required this.imagePath,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      fit: BoxFit.contain,
    );
  }
}