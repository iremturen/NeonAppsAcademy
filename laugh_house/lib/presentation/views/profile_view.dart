import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_container.dart';
import 'package:laugh_house/presentation/widgets/custom_profile_menu_item.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const CustomText(
                model: CustomTextModel(
                  text: 'MY PROFILE',
                  fontSize: mainTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: white,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 24),
              CustomContainer(
                model: CustomContainerModel(
                  color: neonGreen,
                  borderRadius: borderRadius,
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
                                fontSize: profileCardTitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: bg,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const CustomText(
                              model: CustomTextModel(
                                text: 'Total Points',
                                fontSize: 14,
                                color: pink,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const CustomText(
                              model: CustomTextModel(
                                text: '1,250 pts',
                                fontSize: profileCardPointText,
                                fontWeight: FontWeight.bold,
                                color: pink,
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
                  color: darkPurple,
                  borderRadius: borderRadius,
                  border: Border.all(
                    color: white.withValues(alpha: 0.1),
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
                    const Divider(color: grey, height: 1),
                    ProfileMenuItem(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    const Divider(color: grey, height: 1),
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
        ),
      ),
    );
  }
}


