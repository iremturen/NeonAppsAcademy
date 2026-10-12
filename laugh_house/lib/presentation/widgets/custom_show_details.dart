import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/model/show_model.dart';
import 'package:laugh_house/presentation/models/custom_button_model.dart';
import 'package:laugh_house/presentation/views/buy_ticket_view.dart';
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
        color: AppColor.bg,
        borderRadius: AppDimensions.borderRadius,
        padding: const EdgeInsets.all(AppDimensions.contentPadding),
      ),
      child: Column(
        spacing: AppDimensions.smallSpacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: AppDimensions.bigSpacing,
            children: [
              CustomDateCard(day: model.dateDay, month: model.dateMonth),
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
                        color: AppColor.white.withValues(alpha: AppDimensions.cardBorderOpacity),
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: AppColor.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    model: CustomTextModel(
                      text: 'PRICE',
                      fontSize: AppDimensions.monthCardTitle,
                      color: AppColor.white.withValues(alpha: AppDimensions.cardBorderOpacity),
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomText(
                    model: CustomTextModel(
                      text: '₺ ${model.ticketPrice}',
                      fontSize: AppDimensions.cardTitleFontSize,
                      color: AppColor.neonGreen,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              CustomButton(
                model: CustomButtonModel(
                  text: 'Buy Ticket',
                  backgroundColor: AppColor.pink,
                  textColor: AppColor.bg,
                  borderRadius: AppDimensions.borderRadius,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyTicketView(model: model),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
