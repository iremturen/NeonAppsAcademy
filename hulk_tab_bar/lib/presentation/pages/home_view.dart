import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/constants/colors.dart';
import 'package:hulk_tab_bar/presentation/models/custom_tab_bar_model.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_model.dart';
import 'package:hulk_tab_bar/presentation/pages/mission_view.dart';
import 'package:hulk_tab_bar/presentation/pages/power_view.dart';
import 'package:hulk_tab_bar/presentation/pages/settings.view.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_tab_bar.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeContent(),
    PowerView(),
    MissionView(),
    SettingsView(),
  ];

  final List<CustomTabBarModel> tabs = const [
    CustomTabBarModel(
      icon: Icons.home_rounded,
      title: 'Home',
    ),
    CustomTabBarModel(
      icon: Icons.bolt_rounded,
      title: 'Power',
    ),
    CustomTabBarModel(
      icon: Icons.shield_rounded,
      title: 'Mission',
    ),
    CustomTabBarModel(
      icon: Icons.settings_rounded,
      title: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: CustomTabBar(
        items: tabs,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),

          const CustomText(
            model: CustomTextModel(
              text: 'HULK HEADQUARTERS',
              color: white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 6),
          
          const CustomText(
            model: CustomTextModel(
              text: 'Welcome back, Hulk',
              color: grey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 34),
          Center(
            child: Column(
              children: [
                Container(
                  width: 132,
                  height: 132,
                  decoration: BoxDecoration(
                    color: darkGreen.withValues(alpha: 0.72),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: neonGreen.withValues(alpha: 0.45),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: neonGreen.withValues(alpha: 0.12),
                        blurRadius: 28,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.fitness_center_rounded,
                    color: neonGreen,
                    size: 64,
                  ),
                ),
                const SizedBox(height: 18),
                const CustomText(
                  model: CustomTextModel(
                    text: 'READY FOR THE NEXT MISSION?',
                    textAlign: TextAlign.center,
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 34),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
