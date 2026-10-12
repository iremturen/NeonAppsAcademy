import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/model/show_model.dart';
import 'package:laugh_house/presentation/models/custom_image_model.dart';
import 'package:laugh_house/presentation/widgets/custom_image.dart';
import 'package:laugh_house/presentation/widgets/custom_show_details.dart';

class CustomCard extends StatelessWidget {
  final ShowModel model;

  const CustomCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.white.withValues(
            alpha: AppDimensions.cardBorderOpacity,
          ),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            model: CustomImageModel(
              imagePath: model.imageUrl,
              width: double.infinity,
              height: AppDimensions.cardImageHeight,
              fit: BoxFit.cover,
            ),
          ),
          CustomShowDetails(model: model),
        ],
      ),
    );
  }
}
