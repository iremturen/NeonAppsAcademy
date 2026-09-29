import 'dart:ui';

class AlertButtonModel {
  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  AlertButtonModel({
    required this.title,
    required this.imagePath,
    required this.onPressed,
  });
}