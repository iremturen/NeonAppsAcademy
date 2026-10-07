import 'package:flutter/material.dart';

import 'package:travel_ease/constants/colors.dart';
import 'package:travel_ease/constants/dimensions.dart';
import 'package:travel_ease/data/destinations.dart';
import 'package:travel_ease/presentation/models/custom_text_model.dart';
import 'package:travel_ease/presentation/views/destination_detail_view.dart';
import 'package:travel_ease/presentation/widgets/custom_destination_card.dart';
import 'package:travel_ease/presentation/widgets/custom_text.dart';

class TravelEaseView extends StatelessWidget {
  const TravelEaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 10),
              child: CustomText(
                model: TextModel(
                  text: 'TravelEase',
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: CustomText(
                model: TextModel(
                  text: 'Explore Popular Destination',
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: blue,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridColumnCount,
                  crossAxisSpacing: gridSpacing,
                  mainAxisSpacing: 12,
                ),
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  final destination = destinations[index];

                  return CustomDestinationCard(
                    name: destination['name']!,
                    imageUrl: destination['image']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationDetailView(
                            name: destination['name']!,
                            imageUrl: destination['image']!,
                            details: destination['details']!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
