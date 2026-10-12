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
        borderRadius: AppDimensions.borderRadius,
        border: Border.all(color: AppColor.grey.withValues(alpha: AppDimensions.cardBorderOpacity), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            model: CustomImageModel(
              imagePath: model.imageUrl,
              width: double.infinity,
              height: AppDimensions.complateCardImageHeight,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomText(
              model: CustomTextModel(
                text: model.title,
                fontSize: AppDimensions.complateCardFontSize,
                fontWeight: FontWeight.bold,
                color: AppColor.grey,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
