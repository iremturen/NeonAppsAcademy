import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/model/show_model.dart';
import 'package:laugh_house/presentation/models/custom_button_model.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_button.dart';
import 'package:laugh_house/presentation/widgets/custom_container.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class CustomOrderContainer extends StatelessWidget {
  final ShowModel model;
  final int quantity;

  const CustomOrderContainer({
    super.key,
    required this.model,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        color: darkPurple,
        borderRadius: borderRadius,
        border: Border.all(color: white.withValues(alpha: 0.25), width: 1),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            model: CustomTextModel(
              text: 'ORDER SUMMRY',
              fontSize: cardTitleFontSize,
              fontWeight: FontWeight.bold,
              color: pink,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                model: CustomTextModel(
                  text: 'Total',
                  fontSize: cardTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: white,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomText(
                model: CustomTextModel(
                  text: '₺ ${quantity * model.ticketPrice}',
                  fontSize: cardTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: neonGreen,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40,),
          CustomButton(
            model: CustomButtonModel(
              text: 'CONTINUE TO PAYMENT',
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
