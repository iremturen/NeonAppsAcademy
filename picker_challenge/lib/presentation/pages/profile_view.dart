import 'package:flutter/material.dart';
import 'package:picker_challenge/constants/colors.dart';
import 'package:picker_challenge/data/tab_bar_items.dart';
import 'package:picker_challenge/data/user_data.dart';
import 'package:picker_challenge/navigation/page_navigation.dart';
import 'package:picker_challenge/presentation/widgets/custom_tabbar.dart';
import 'package:picker_challenge/presentation/models/user_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int selectedIndex = 0;
  late final UserModel user = UserModel(
    name: userName,
    age: userAge,
    image: userImage,
    color: blue,
    fontFamily: 'Roboto',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: user.color,
      body: PageNavigation.buildPage(
        selectedIndex: selectedIndex,
        user: user,
        onColorChanged: (color) {
          setState(() {
            user.color = color;
          });
        },
        onFontChanged: (font) {
          setState(() {
            user.fontFamily = font;
          });
        },
        onImageChanged: (image) {
          setState(() {
            user.image = image;
            selectedIndex = 0;
          });
        },
        onAgeChanged: () {
          setState(() {
            selectedIndex = 0;
          });
        },
      ),
      bottomNavigationBar: CustomTabBar(
        items: tabBarItems,
        selectedIndex: selectedIndex,
        user: user,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
