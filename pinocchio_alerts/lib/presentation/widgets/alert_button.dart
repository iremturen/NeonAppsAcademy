import 'package:flutter/material.dart';

import 'package:pinocchio_alerts/common/constants/colors.dart';
import 'package:pinocchio_alerts/common/constants/dimensions.dart';
import 'package:pinocchio_alerts/presentation/model/alert_button_model.dart';
import 'package:pinocchio_alerts/presentation/model/container_model.dart';
import 'package:pinocchio_alerts/presentation/model/text_model.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_container.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_text.dart';

class AlertButton extends StatelessWidget {
  final AlertButtonModel model;

  const AlertButton({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onPressed,
      child: CustomContainer(
        model: const ContainerModel(
          color: blue,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          border: Border.fromBorderSide(
            BorderSide(
              color: darkBrown,
              width: 3,
            ),
          ),
          padding: EdgeInsets.all(12),
        ),
        child: Row(
          children: [
            Image.asset(
              model.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: CustomText(
                model: TextModel(
                  text: model.title,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}