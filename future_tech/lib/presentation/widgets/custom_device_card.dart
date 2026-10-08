import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:future_tech/constants/colors.dart';
import 'package:future_tech/constants/dimension.dart';
import 'package:future_tech/presentation/models/custom_container_model.dart';
import 'package:future_tech/presentation/models/custom_image_model.dart';
import 'package:future_tech/presentation/models/custom_text_model.dart';
import 'package:future_tech/presentation/widgets/custom_container.dart';
import 'package:future_tech/presentation/widgets/custom_image.dart';
import 'package:future_tech/presentation/widgets/custom_switch.dart';
import 'package:future_tech/presentation/widgets/custom_text.dart';

class CustomDeviceCard extends StatefulWidget {
  final String imagePath;
  final String deviceName;

  const CustomDeviceCard({
    super.key,
    required this.imagePath,
    required this.deviceName,
  });

  @override
  State<CustomDeviceCard> createState() => _CustomDeviceCardState();
}

class _CustomDeviceCardState extends State<CustomDeviceCard> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 12,
          sigmaY: 12,
        ),
        child: CustomContainer(
          model: CustomContainerModel(
            color: white.withValues(alpha: 0.08),
            borderRadius: borderRadius,
            padding: const EdgeInsets.all(20),
            border: Border.all(
              color: white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImage(
                model: CustomImageModel(
                  imagePath: widget.imagePath,
                  width: cardIconSize,
                  height: cardIconSize,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 14),

              CustomText(
                model: CustomTextModel(
                  text: widget.deviceName,
                  fontSize: cardTitleFontSize,
                  fontWeight: FontWeight.w600,
                  color: white,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: isOn ? green : grey,
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 6),

                  CustomText(
                    model: CustomTextModel(
                      text: isOn ? 'Connected' : 'Offline',
                      fontSize: connectedText,
                      fontWeight: FontWeight.w500,
                      color: isOn ? green : grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              CustomSwitch(
                value: isOn,
                onChanged: (value) {
                  setState(() {
                    isOn = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}