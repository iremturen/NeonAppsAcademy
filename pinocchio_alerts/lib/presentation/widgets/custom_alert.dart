import 'package:flutter/material.dart';
import 'package:pinocchio_alerts/common/constants/dimensions.dart';

import 'package:pinocchio_alerts/presentation/model/alert_model.dart';
import 'package:pinocchio_alerts/presentation/model/container_model.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_container.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_text.dart';
import 'package:pinocchio_alerts/presentation/model/text_model.dart';
import 'package:pinocchio_alerts/common/constants/colors.dart';

class CustomAlert extends StatelessWidget {
  final AlertModel model;

  const CustomAlert({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: CustomContainer(
        model: ContainerModel(
          color: cream,
          padding: const EdgeInsets.all(24),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: cream,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              model: TextModel(
                text: model.title,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: red,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 12),

            model.child,
          ],
        ),
      ),
    );
  }
}