import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marina_grid_view/common/helpers/share_helper.dart';
import 'package:marina_grid_view/constants/colors.dart';
import 'package:marina_grid_view/constants/dimensions.dart';
import 'package:marina_grid_view/data/model/app_model.dart';
import 'package:marina_grid_view/presentation/models/custom_container_model.dart';
import 'package:marina_grid_view/presentation/models/custom_image_model.dart';
import 'package:marina_grid_view/presentation/models/custom_text_model.dart';
import 'package:marina_grid_view/presentation/pages/app_detail_view.dart';
import 'package:marina_grid_view/presentation/widgets/custom_container.dart';
import 'package:marina_grid_view/presentation/widgets/custom_image.dart';
import 'package:marina_grid_view/presentation/widgets/custom_text.dart';

class AppCard extends StatelessWidget {
  final AppModel app;
  final VoidCallback onTap;

  const AppCard({super.key, required this.app, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          trailingIcon: CupertinoIcons.share,
          onPressed: () {
            Navigator.pop(context);

            ShareHelper.shareApp(appName: app.appName, storeUrl: app.storeURL);
          },
          child: const Text('Share'),
        ),
        CupertinoContextMenuAction(
          trailingIcon: CupertinoIcons.info,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppDetailView(app: app)),
            );
          },
          child: const Text('Details'),
        ),
      ],
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(
          model: CustomContainerModel(
            color: app.isSelect ? cream : white,
            borderRadius: borderRadius,
            padding: const EdgeInsets.all(12),
            border: app.isSelect ? Border.all(color: grey, width: 1) : null,
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                model: CustomImageModel(
                  image: app.appIcon,
                  width: appIconSize,
                  height: appIconSize,
                  borderRadius: BorderRadius.circular(appIconBorderRadius),
                ),
              ),
              const SizedBox(height: 20),
              CustomText(
                model: CustomTextModel(
                  text: app.appName,
                  fontSize: appTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: black,
                  textAlign: TextAlign.center,
                ),
              ),
              CustomText(
                model: CustomTextModel(
                  text: app.appCategory,
                  fontSize: appSubtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: grey,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
