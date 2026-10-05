import 'package:flutter/material.dart';
import 'package:news_list_view/constants/colors.dart';
import 'package:news_list_view/constants/dimensions.dart';

import 'package:news_list_view/presentation/models/custom_container_model.dart';
import 'package:news_list_view/presentation/models/custom_image_model.dart';
import 'package:news_list_view/presentation/models/custom_text_model.dart';

import 'package:news_list_view/presentation/widgets/custom_container.dart';
import 'package:news_list_view/presentation/widgets/custom_image.dart';
import 'package:news_list_view/presentation/widgets/custom_text.dart';

class NewsGridCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const NewsGridCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: const CustomContainerModel(
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
        width: double.infinity,
        padding: EdgeInsets.all(8),
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            model: CustomImageModel(
              borderRadius: BorderRadius.circular(imageBorderRadius),
              imagePath: imagePath,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          CustomText(
            model: CustomTextModel(
              text: title,
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          CustomText(
            model: CustomTextModel(
              text: subtitle,
              fontSize: cardSubtitleFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
