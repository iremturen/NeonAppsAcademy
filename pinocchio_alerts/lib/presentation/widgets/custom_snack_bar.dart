import 'package:flutter/material.dart';

import 'package:pinocchio_alerts/common/constants/colors.dart';
import 'package:pinocchio_alerts/common/constants/dimensions.dart';
import 'package:pinocchio_alerts/presentation/model/snack_bar_model.dart';

class CustomSnackBar {
  static void show(
    BuildContext context,
    SnackBarModel model,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          model.message,
          style: const TextStyle(
            color: darkBrown,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: yellow,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}