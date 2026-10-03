import 'package:flutter/material.dart';

import 'package:titanic_passengers/constants/colors.dart';
import 'package:titanic_passengers/constants/dimensions.dart';
import 'package:titanic_passengers/data/model/passenger_model.dart';
import 'package:titanic_passengers/presentation/models/custom_text_model.dart';
import 'package:titanic_passengers/presentation/widgets/custom_text.dart';
import 'package:titanic_passengers/presentation/widgets/detail_row.dart';

class PassengerDetailView extends StatelessWidget {
  final PassengerModel passenger;

  const PassengerDetailView({
    super.key,
    required this.passenger,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: greyBlue,
        foregroundColor: cream,
        title: CustomText(
          model: TextModel(
            text: 'PASSENGER DETAILS',
            fontSize: subtitleFontSize,
            fontWeight: FontWeight.bold,
            color: cream,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              model: TextModel(
                text: '${passenger.name} ${passenger.surname}',
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),
            const SizedBox(height: 24),
            DetailRow(label: 'Age ', value: passenger.age.toString()),
            DetailRow(label: 'Hometown ', value: passenger.hometown),
            DetailRow(label: 'Mail ', value: passenger.mail),
          ],
        ),
      ),
    );
  }
}

