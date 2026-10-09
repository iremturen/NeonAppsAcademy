import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/model/show_model.dart';
import 'package:laugh_house/presentation/models/custom_button_model.dart';
import 'package:laugh_house/presentation/widgets/custom_button.dart';
import 'package:laugh_house/presentation/widgets/custom_container.dart';
import 'package:laugh_house/presentation/widgets/custom_date_card.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';

class CustomShowDetails extends StatelessWidget {
  final ShowModel model;

  const CustomShowDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        color: bg,
        borderRadius: borderRadius,
        padding: const EdgeInsets.all(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomDateCard(day: model.dateDay, month: model.dateMonth),
              const SizedBox(width: 14),
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
                    CustomText(
                      model: CustomTextModel(
                        text: model.time,
                        fontSize: cardSubtitleFontSize,
                        color: white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: grey),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    model: CustomTextModel(
                      text: 'PRICE',
                      fontSize: monthCardTitle,
                      color: white.withValues(alpha: 0.6),
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomText(
                    model: CustomTextModel(
                      text: '₺ ${model.ticketPrice}',
                      fontSize: cardTitleFontSize,
                      color: neonGreen,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              CustomButton(
                model: CustomButtonModel(
                  text: 'Buy Ticket',
                  backgroundColor: pink,
                  textColor: bg,
                  borderRadius: 10,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
