import 'package:flutter/material.dart';
import 'package:marina_grid_view/constants/colors.dart';
import 'package:marina_grid_view/constants/dimensions.dart';
import 'package:marina_grid_view/presentation/models/custom_app_bar_model.dart';
import 'package:marina_grid_view/presentation/models/custom_text_model.dart';
import 'package:marina_grid_view/presentation/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CustomAppBarModel model;

  const CustomAppBar({super.key, required this.model});

  @override
  Size get preferredSize => Size.fromHeight(model.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 12),
          CustomText(
            model: CustomTextModel(
              text: model.title,
              fontSize: appBarTitleFontSize,
              fontWeight: FontWeight.bold,
              color: turquoise,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      backgroundColor: model.backgroundColor,
      toolbarHeight: model.height,
    );
  }
}
