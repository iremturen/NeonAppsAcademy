import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_button_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_button.dart';
import 'package:laugh_house/presentation/widgets/custom_page_app_bar.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class MyTicketsView extends StatelessWidget {
  final VoidCallback onExploreEvents;

  const MyTicketsView({super.key, required this.onExploreEvents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomPageAppBar(title: "MY TICKETS"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.pagePadding),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.contentPadding),
              child: Column(spacing: AppDimensions.bigSpacing,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.confirmation_number_outlined,
                    size: AppDimensions.iconSize,
                    color: AppColor.grey,
                  ),
                  const CustomText(
                    model: CustomTextModel(
                      text: "You don't have any tickets yet",
                      fontSize: AppDimensions.mainSubtitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const CustomText(
                    model: CustomTextModel(
                      text:
                          'Find a show and make it a night to remember!',
                      fontSize: AppDimensions.mainSubtitleFontSize,
                      color: AppColor.grey,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomButton(
                    model: CustomButtonModel(
                      text: 'Explore Events',
                      onPressed: onExploreEvents,
                      backgroundColor: AppColor.pink,
                      textColor: AppColor.bg,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.buttonHorizontalPadding,
                        vertical: AppDimensions.buttonVerticalPadding,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
