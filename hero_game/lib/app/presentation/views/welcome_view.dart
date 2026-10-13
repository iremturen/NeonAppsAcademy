import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hero_game/app/common/constants/app_strings.dart';
import 'package:hero_game/app/common/constants/colors.dart';
import 'package:hero_game/app/common/constants/dimensions.dart';
import 'package:hero_game/app/common/constants/font_size.dart';
import 'package:hero_game/app/common/constants/font_weight.dart';
import 'package:hero_game/app/common/utils/responsive_helper.dart';
import 'package:hero_game/app/common/widgets/custom_button.dart';
import 'package:hero_game/app/common/widgets/custom_container.dart';
import 'package:hero_game/app/common/widgets/custom_text.dart';
import 'package:hero_game/app/data/models/custom_button_model.dart';
import 'package:hero_game/app/data/models/custom_container_model.dart';
import 'package:hero_game/app/data/models/custom_text_model.dart';
import 'package:hero_game/app/presentation/views/maze_view.dart';
import 'package:hero_game/app/presentation/widgets/custom_background.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const CustomBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingLarge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomContainer(
                    model: CustomContainerModel(
                      color: AppColor.transparent,
                      borderRadius: AppDimensions.borderRadius,
                    ),
                    child: Column(
                      spacing: AppDimensions.spacingSmall,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          model: CustomTextModel(
                            text: AppStrings.welcomeTitle,
                            fontSize: AppFontSize.title.value,
                            fontWeight: AppFontWeight.bold.value,
                            color: AppColor.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CustomText(
                          model: CustomTextModel(
                            text: AppStrings.welcomeSubtitle,
                            fontSize: AppFontSize.big.value,
                            fontWeight: AppFontWeight.normal.value,
                            color: AppColor.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: ResponsiveHelper.screenWidth(context),
                    child: CustomButton(
                      model: CustomButtonModel(
                        fontSize: AppFontSize.big,
                        borderWidth: AppDimensions.buttonBorder,
                        borderColor: AppColor.blue,
                        textColor: AppColor.white,
                        backgroundColor: AppColor.darkBlue,
                        text: AppStrings.welcomeButtonText,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MazeView(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
