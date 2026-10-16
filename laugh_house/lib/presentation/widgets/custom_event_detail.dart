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
    return Column(
      spacing : AppDimensions.bigSpacing,
      children: [
        CustomImage(
          model: CustomImageModel(
            imagePath: model.imageUrl,
            width: double.infinity,
            height: AppDimensions.buyTicketsEventImageSize,
            fit: BoxFit.contain,
          ),
        ),
        Row(
          spacing : AppDimensions.bigSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDateCard(
              day: model.dateDay,
              month: model.dateMonth,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    model: CustomTextModel(
                      text: model.title,
                      fontSize: AppDimensions.cardTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomText(
                    model: CustomTextModel(
                      text: model.time,
                      fontSize: AppDimensions.cardSubtitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColor.pink,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
