import 'package:flutter/material.dart';
import 'package:travel_ease/constants/colors.dart';
import 'package:travel_ease/constants/dimensions.dart';
import 'package:travel_ease/presentation/models/custom_container_model.dart';
import 'package:travel_ease/presentation/models/custom_image_model.dart';
import 'package:travel_ease/presentation/models/custom_text_model.dart';
import 'package:travel_ease/presentation/widgets/custom_container.dart';
import 'package:travel_ease/presentation/widgets/custom_image.dart';
import 'package:travel_ease/presentation/widgets/custom_text.dart';

class CustomDestinationCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const CustomDestinationCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      model: ContainerModel(
        color: white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomImage(
              model: ImageModel(
                imageUrl: imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomText(
              model: TextModel(
                text: name,
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.bold,
                color: blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
