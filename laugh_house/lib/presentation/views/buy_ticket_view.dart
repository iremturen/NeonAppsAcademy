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
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  model: CustomContainerModel(
                    color: bg,
                    borderRadius: borderRadius,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: grey,
                          size: buyTicketsBackIconSizez,
                        ),
                      ),
                      CustomText(
                        model: CustomTextModel(
                          text: 'BACK TO SCHEDULE',
                          fontSize: mainSubtitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: grey,
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
                    fontSize: mainSubtitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: pink,
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomText(
                  model: CustomTextModel(
                    text: 'ONE LAST STEP',
                    fontSize: mainTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: white,
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
                CustomOrderContainer(
                  model: model,
                  quantity: quantity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
