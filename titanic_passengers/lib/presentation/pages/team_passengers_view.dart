import 'package:flutter/material.dart';

import 'package:titanic_passengers/constants/colors.dart';
import 'package:titanic_passengers/constants/dimensions.dart';
import 'package:titanic_passengers/data/model/passenger_model.dart';
import 'package:titanic_passengers/presentation/models/custom_data_table_model.dart';
import 'package:titanic_passengers/presentation/models/custom_text_model.dart';
import 'package:titanic_passengers/presentation/widgets/custom_data_table.dart';
import 'package:titanic_passengers/presentation/widgets/custom_text.dart';
import 'package:titanic_passengers/presentation/pages/passenger_detail_view.dart';

class TeamPassengersView extends StatelessWidget {
  final List<PassengerModel> passengers;
  final String title;

  const TeamPassengersView({
    super.key,
    required this.passengers,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: greyBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: cream),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CustomText(
          model: TextModel(
            text: '$title TEAM PASSENGERS',
            fontSize: subtitleFontSize,
            fontWeight: FontWeight.bold,
            color: cream,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: CustomDataTable(
              passengers: passengers,
              model: const CustomDataTableModel(),
              onPassengerTap: (passenger) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PassengerDetailView(
                      passenger: passenger,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
