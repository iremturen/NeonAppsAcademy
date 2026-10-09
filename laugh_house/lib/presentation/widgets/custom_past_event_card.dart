import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/model/show_model.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';
import 'package:laugh_house/presentation/models/custom_image_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_container.dart';
import 'package:laugh_house/presentation/widgets/custom_image.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class CustomPastEventCard extends StatelessWidget {
  final ShowModel model;

  const CustomPastEventCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        color: Colors.transparent,
        borderRadius: borderRadius,
        border: Border.all(color: grey.withValues(alpha: 0.6), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            model: CustomImageModel(
              imagePath: model.imageUrl,
              width: double.infinity,
              height: complateCardImageHeight,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomText(
              model: CustomTextModel(
                text: model.title,
                fontSize: complateCardFontSize,
                fontWeight: FontWeight.bold,
                color: grey,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
