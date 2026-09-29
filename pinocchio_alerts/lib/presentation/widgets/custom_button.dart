import 'package:flutter/material.dart';

import 'package:pinocchio_alerts/common/constants/colors.dart';
import 'package:pinocchio_alerts/common/constants/dimensions.dart';
import 'package:pinocchio_alerts/presentation/model/button_model.dart';
import 'package:pinocchio_alerts/presentation/model/container_model.dart';
import 'package:pinocchio_alerts/presentation/model/text_model.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_container.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final ButtonModel model;

  const CustomButton({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onPressed,
      child: CustomContainer(
        model: ContainerModel(
          color: yellow,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: darkBrown,
            width: 2,
          ),
        ),
        child: CustomText(
          model: TextModel(
            text: model.title,
            fontSize: subtitleFontSize,
            fontWeight: FontWeight.bold,
            color: darkBrown,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}