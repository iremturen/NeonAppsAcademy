import 'package:flutter/material.dart';

import 'package:search_bar_challenge/constants/colors.dart';
import 'package:search_bar_challenge/constants/dimension.dart';
import 'package:search_bar_challenge/data/model/member_model.dart';
import 'package:search_bar_challenge/presentation/models/custom_image_model.dart';
import 'package:search_bar_challenge/presentation/models/custom_text_model.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_image.dart';
import 'package:search_bar_challenge/presentation/widgets/custom_text.dart';

class CustomDataTable extends StatelessWidget {
  final List<PersonModel> people;

  const CustomDataTable({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            dividerThickness: 1,
            border: TableBorder.all(color: yellow, width: 2),
            headingRowColor: const WidgetStatePropertyAll(yellow),
            columns: const [
              DataColumn(
                label: Row(
                  children: [
                    CustomImage(
                      model: CustomImageModel(
                        imagePath: 'assets/images/mickey_icon.png',
                        width: columnIconSize,
                        height: columnIconSize,
                      ),
                    ),
                    SizedBox(width: 16),
                    CustomText(model: CustomTextModel(text: 'Name')),
                  ],
                ),
              ),
              DataColumn(
                label: Row(
                  children: [
                    CustomImage(
                      model: CustomImageModel(
                        imagePath: 'assets/images/mickey_icon.png',
                        width: columnIconSize,
                        height: columnIconSize,
                      ),
                    ),
                    SizedBox(width: 16),
                    CustomText(model: CustomTextModel(text: 'Surname')),
                  ],
                ),
              ),
            ],
            rows: people.map((person) {
              return DataRow(
                cells: [
                  DataCell(
                    CustomText(model: CustomTextModel(text: person.name)),
                  ),
                  DataCell(
                    CustomText(model: CustomTextModel(text: person.surname)),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
