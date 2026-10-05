import 'package:flutter/material.dart';
import 'package:news_list_view/constants/colors.dart';
import 'package:news_list_view/constants/dimensions.dart';

import 'package:news_list_view/presentation/models/custom_container_model.dart';
import 'package:news_list_view/presentation/models/custom_image_model.dart';
import 'package:news_list_view/presentation/models/custom_text_model.dart';

import 'package:news_list_view/presentation/widgets/custom_container.dart';
import 'package:news_list_view/presentation/widgets/custom_image.dart';
import 'package:news_list_view/presentation/widgets/custom_text.dart';

class NewsCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const NewsCard({
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
        width: double.infinity,
        padding: EdgeInsets.all(12),
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomImage(
            model: CustomImageModel(
              imagePath: imagePath,
              width: newsImageWidth,
              height: newsImageHeight,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(imageBorderRadius),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  model: CustomTextModel(
                    text: title,
                    fontSize: cardTitleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                CustomText(
                  model: CustomTextModel(
                    text: subtitle,
                    fontSize: cardSubtitleFontSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}