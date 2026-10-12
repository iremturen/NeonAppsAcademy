import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/model/show_model.dart';
import 'package:laugh_house/presentation/models/custom_image_model.dart';
import 'package:laugh_house/presentation/widgets/custom_date_card.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_image.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class CustomEventDetail extends StatelessWidget {
  final ShowModel model;

  const CustomEventDetail({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImage(
                model: CustomImageModel(
                  imagePath: model.imageUrl,
                  width: double.infinity,
                  height: buyTicketsEventImageSize,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDateCard(
                    day: model.dateDay,
                    month: model.dateMonth,
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          model: CustomTextModel(
                            text: model.title,
                            fontSize: cardTitleFontSize,
                            fontWeight: FontWeight.bold,
                            color: white,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomText(
                          model: CustomTextModel(
                            text: model.time,
                            fontSize: cardSubtitleFontSize,
                            fontWeight: FontWeight.bold,
                            color: pink,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
