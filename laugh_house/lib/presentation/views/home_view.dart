import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/enum/show_status.dart';
import 'package:laugh_house/data/shows.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_app_bar.dart';
import 'package:laugh_house/presentation/widgets/custom_card.dart';
import 'package:laugh_house/presentation/widgets/custom_past_event_card.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const SizedBox(height: 24),
                CustomText(
                  model: CustomTextModel(
                    text: 'FREE UP YOUR NIGHT FOR COMEDY',
                    fontSize: mainSubtitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: pink,
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomText(
                  model: CustomTextModel(
                    text: 'UPCOMING SHOWS',
                    fontSize: mainTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: white,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 20),

                ...shows
                    .where((show) => show.status == ShowStatus.upcoming)
                    .map(
                      (show) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CustomCard(model: show),
                      ),
                    ),

                const SizedBox(height: 28),

                CustomText(
                  model: CustomTextModel(
                    text: 'PAST EVENTS',
                    fontSize: mainTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: white,
                    textAlign: TextAlign.left,
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: shows
                        .where((show) => show.status == ShowStatus.completed)
                        .map(
                          (show) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              width: 150,
                              child: CustomPastEventCard(model: show),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
