import 'package:flutter/material.dart';

import 'package:travel_ease/constants/colors.dart';
import 'package:travel_ease/constants/dimensions.dart';
import 'package:travel_ease/presentation/models/custom_image_model.dart';
import 'package:travel_ease/presentation/models/custom_text_model.dart';
import 'package:travel_ease/presentation/widgets/custom_image.dart';
import 'package:travel_ease/presentation/widgets/custom_text.dart';

class DestinationDetailView extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String details;

  const DestinationDetailView({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: navy),
                ),
                Expanded(
                  child: CustomText(
                    model: TextModel(
                      text: name,
                      fontSize: detailTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomImage(
              model: ImageModel(
                imageUrl: imageUrl,
                width: double.infinity,
                height: detailImageSize,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12),
              child: CustomText(
                model: TextModel(
                  text: details,
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
