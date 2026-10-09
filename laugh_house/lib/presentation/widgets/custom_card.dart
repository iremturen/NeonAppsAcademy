import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/model/show_model.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';
import 'package:laugh_house/presentation/models/custom_image_model.dart';
import 'package:laugh_house/presentation/widgets/custom_container.dart';
import 'package:laugh_house/presentation/widgets/custom_image.dart';
import 'package:laugh_house/presentation/widgets/custom_show_details.dart';

class CustomCard extends StatelessWidget {
  final ShowModel model;

  const CustomCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          color: white.withValues(alpha: 0.25),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomImage(
                model: CustomImageModel(
                  imagePath: model.imageUrl,
                  width: double.infinity,
                  height: cardImageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 100,
                child: CustomContainer(
                  model: CustomContainerModel(
                    color: Colors.transparent,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        bg,
                      ],
                    ),
                    borderRadius: borderRadius,
                  ),
                ),
              ),
            ],
          ),
          CustomShowDetails(model: model),
        ],
      ),
    );
  }
}