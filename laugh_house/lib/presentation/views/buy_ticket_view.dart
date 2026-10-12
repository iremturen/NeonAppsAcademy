import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/model/show_model.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_container.dart';
import 'package:laugh_house/presentation/widgets/custom_event_detail.dart';
import 'package:laugh_house/presentation/widgets/custom_order_container.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';
import 'package:laugh_house/presentation/widgets/custom_ticket_option.dart';

class BuyTicketView extends StatefulWidget {
  final ShowModel model;

  const BuyTicketView({super.key, required this.model});

  @override
  State<BuyTicketView> createState() => _BuyTicketViewState();
}

class _BuyTicketViewState extends State<BuyTicketView> {
  int quantity = 1;

  ShowModel get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(AppDimensions.pagePadding),
          children: [
            CustomContainer(
              model: CustomContainerModel(
                color: AppColor.bg,
                borderRadius: AppDimensions.borderRadius,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColor.grey,
                      size: AppDimensions.buyTicketsBackIconSizez,
                    ),
                  ),
                  CustomText(
                    model: CustomTextModel(
                      text: 'BACK TO SCHEDULE',
                      fontSize: AppDimensions.mainSubtitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            CustomText(
              model: CustomTextModel(
                text: 'Choose Your Tickets',
                fontSize: AppDimensions.mainSubtitleFontSize,
                fontWeight: FontWeight.bold,
                color: AppColor.pink,
                textAlign: TextAlign.left,
              ),
            ),
            CustomText(
              model: CustomTextModel(
                text: 'ONE LAST STEP',
                fontSize: AppDimensions.mainTitleFontSize,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 24),
            CustomEventDetail(model: model),
            const SizedBox(height: 24),

            CustomTicketOption(
              quantity: quantity,
              onChanged: (newQuantity) {
                setState(() {
                  quantity = newQuantity;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomOrderContainer(model: model, quantity: quantity),
          ],
        ),
      ),
    );
  }
}
