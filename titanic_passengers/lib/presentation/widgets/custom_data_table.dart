import 'package:flutter/material.dart';

import 'package:titanic_passengers/constants/colors.dart';
import 'package:titanic_passengers/data/model/passenger_model.dart';
import 'package:titanic_passengers/presentation/models/custom_data_table_model.dart';
import 'package:titanic_passengers/presentation/models/custom_text_model.dart';
import 'package:titanic_passengers/presentation/widgets/custom_text.dart';

class CustomDataTable extends StatelessWidget {
  final List<PassengerModel> passengers;
  final CustomDataTableModel model;
  final ValueChanged<PassengerModel> onPassengerTap;

  const CustomDataTable({
    super.key,
    required this.passengers,
    required this.model,
    required this.onPassengerTap,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      headingRowColor: const WidgetStatePropertyAll(beige),
      dataRowColor: const WidgetStatePropertyAll(lightBeige),
      headingRowHeight: model.headingRowHeight,
      dataRowMinHeight: model.dataRowHeight,
      horizontalMargin: model.horizontalMargin,
      columnSpacing: model.columnSpacing,
      border: TableBorder.symmetric(
        outside: BorderSide(color: beige, width: 1),
      ),
      columns: const [
        DataColumn(
          label: CustomText(model: TextModel(text: 'Name')),
        ),
        DataColumn(
          label: CustomText(model: TextModel(text: 'Surname')),
        ),
        DataColumn(
          label: CustomText(model: TextModel(text: 'Age')),
        ),
        DataColumn(
          label: CustomText(model: TextModel(text: 'Contact')),
        ),
      ],
      rows: passengers.map((passenger) {
        return DataRow(
          onSelectChanged: (_) {
            onPassengerTap(passenger);
          },
          cells: [
            DataCell(CustomText(model: TextModel(text: passenger.name))),
            DataCell(CustomText(model: TextModel(text: passenger.surname))),
            DataCell(
              CustomText(model: TextModel(text: passenger.age.toString())),
            ),
            DataCell(
              TextButton(
                onPressed: () {
                  onPassengerTap(passenger);
                },
                child: const CustomText(model: TextModel(text: 'Details')),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
