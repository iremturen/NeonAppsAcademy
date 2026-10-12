import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_container.dart';
import 'package:laugh_house/presentation/widgets/custom_page_app_bar.dart';
import 'package:laugh_house/presentation/widgets/custom_profile_menu_item.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: const CustomPageAppBar(title: 'PROFILE'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * AppDimensions.pageHorizontalPaddingRatio,
            vertical: AppDimensions.pagePadding,
          ),
          children: [
            CustomContainer(
              model: CustomContainerModel(
                color: AppColor.neonGreen,
                borderRadius: AppDimensions.borderRadius,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            model: CustomTextModel(
                              text: 'Irem Turen',
                              fontSize: AppDimensions.profileCardTitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: AppColor.bg,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const CustomText(
                            model: CustomTextModel(
                              text: 'Total Points',
                              fontSize: 14,
                              color: AppColor.pink,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const CustomText(
                            model: CustomTextModel(
                              text: '1,250 pts',
                              fontSize: AppDimensions.profileCardPointText,
                              fontWeight: FontWeight.bold,
                              color: AppColor.pink,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomContainer(
              model: CustomContainerModel(
                color: AppColor.darkPurple,
                borderRadius: AppDimensions.borderRadius,
                border: Border.all(
                  color: AppColor.white.withValues(
                    alpha: AppDimensions.cardBorderOpacity,
                  ),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person_outline,
                    title: 'Personal Information',
                    onTap: () {},
                  ),
                  const Divider(color: AppColor.grey, height: 1),
                  ProfileMenuItem(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  const Divider(color: AppColor.grey, height: 1),
                  ProfileMenuItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {},
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
