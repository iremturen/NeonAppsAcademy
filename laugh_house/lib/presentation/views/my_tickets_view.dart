import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_button_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_button.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class MyTicketsView extends StatelessWidget {
  final VoidCallback onExploreEvents;

  const MyTicketsView({super.key, required this.onExploreEvents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                model: CustomTextModel(
                  text: 'MY TICKETS',
                  fontSize: mainTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: white,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
              const Icon(
                Icons.confirmation_number_outlined,
                size: iconSize,
                color: grey,
              ),
              const SizedBox(height: 20),
              const CustomText(
                model: CustomTextModel(
                  text: "You don't have any tickets yet",
                  fontSize: mainSubtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: white,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                model: CustomTextModel(
                  text: 'Find a show and make it a night to remember!',
                  fontSize: mainSubtitleFontSize,
                  color: grey,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                model: CustomButtonModel(
                  text: 'Explore Events',
                  onPressed: onExploreEvents,
                  backgroundColor: pink,
                  textColor: bg,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                ),
              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
