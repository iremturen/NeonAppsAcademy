import 'package:flutter/material.dart';
import 'package:marina_grid_view/common/helpers/url_helper.dart';
import 'package:marina_grid_view/constants/colors.dart';
import 'package:marina_grid_view/constants/dimensions.dart';
import 'package:marina_grid_view/data/model/app_model.dart';
import 'package:marina_grid_view/presentation/models/custom_button_model.dart';
import 'package:marina_grid_view/presentation/models/custom_container_model.dart';
import 'package:marina_grid_view/presentation/models/custom_image_model.dart';
import 'package:marina_grid_view/presentation/models/custom_text_model.dart';
import 'package:marina_grid_view/presentation/widgets/app_detail_table.dart';
import 'package:marina_grid_view/presentation/widgets/custom_button.dart';
import 'package:marina_grid_view/presentation/widgets/custom_container.dart';
import 'package:marina_grid_view/presentation/widgets/custom_image.dart';
import 'package:marina_grid_view/presentation/widgets/custom_text.dart';

class AppDetailView extends StatelessWidget {
  final AppModel app;

  const AppDetailView({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          model: CustomTextModel(
            text: 'App Detail',
            fontSize: appTitleFontSize,
            fontWeight: FontWeight.bold,
            color: black,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomImage(
              model: CustomImageModel(
                image: app.appIcon,
                width: detailsIconSize,
                height: detailsIconSize,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const SizedBox(height: 32),
            CustomContainer(
              model: CustomContainerModel(
                color: white,
                borderRadius: borderRadius,
                padding: const EdgeInsets.all(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    model: CustomTextModel(
                      text: 'App Details',
                      fontSize: detailsTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: salmon,
                      textAlign: TextAlign.left,
                    ),
                  ),

                  const SizedBox(height: 20),
                  AppDetailTable(app: app),
                  const SizedBox(height: 36),

                  CustomButton(
                    model: CustomButtonModel(
                      text: 'Go to App',
                      backgroundColor: salmon,
                      textColor: cream,
                      fontSize: tableTextFontSize,
                      fontWeight: FontWeight.bold,
                      borderRadius: borderRadius,
                    ),
                    onPressed: () => UrlHelper.openUrl(app.storeURL),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
