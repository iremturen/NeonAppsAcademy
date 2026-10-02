import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/constants/colors.dart';
import 'package:hulk_tab_bar/constants/dimensions.dart';
import 'package:hulk_tab_bar/presentation/controller/page_navigation.dart';
import 'package:hulk_tab_bar/presentation/data/tab_bar_items.dart';
import 'package:hulk_tab_bar/presentation/models/custom_icon_container_model.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_model.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_container_model.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_icon_container.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_tab_bar.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_text_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageNavigation.pages[selectedIndex],
      bottomNavigationBar: CustomTabBar(
        items: tabBarItems,
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 180),
            const CustomTextContainer(
              model: CustomTextContainerModel(
                title: CustomTextModel(
                  text: 'WORLD NEEDS HULK',
                  color: white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: CustomTextModel(
                  text: 'A new mission is waiting for you.',
                  color: grey,
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 34),
            const CustomIconContainer(
              model: CustomIconContainerModel(
                icon: Icons.fitness_center_rounded,
                backgroundColor: darkGreen,
                borderColor: green,
                iconColor: neonGreen,
                shadowColor: darkGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
