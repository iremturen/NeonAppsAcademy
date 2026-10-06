import 'package:flutter/material.dart';

import 'package:marina_grid_view/constants/colors.dart';
import 'package:marina_grid_view/constants/dimensions.dart';
import 'package:marina_grid_view/data/model/app_model.dart';
import 'package:marina_grid_view/presentation/models/custom_text_model.dart';
import 'package:marina_grid_view/presentation/widgets/custom_text.dart';

class AppDetailTable extends StatelessWidget {
  final AppModel app;

  const AppDetailTable({
    super.key,
    required this.app,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: white,
          width: 1,
        ),
      ),
      children: [
        _detailRow(
          title: 'App Name',
          value: app.appName,
        ),
        _detailRow(
          title: 'Release Date',
          value: app.releaseDate,
        ),
        _detailRow(
          title: 'Category',
          value: app.appCategory,
        ),
      ],
    );
  }

  TableRow _detailRow({
    required String title,
    required String value,
  }) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 4,
          ),
          child: CustomText(
            model: CustomTextModel(
              text: title,
              fontSize: tableTextFontSize,
              fontWeight: FontWeight.bold,
              color: turquoise,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 4,
          ),
          child: CustomText(
            model: CustomTextModel(
              text: value,
              fontSize: tableTextFontSize,
              fontWeight: FontWeight.normal,
              color: black,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
