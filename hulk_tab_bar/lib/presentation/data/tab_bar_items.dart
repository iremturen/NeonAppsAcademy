import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/presentation/models/custom_tab_bar_model.dart';

const List<CustomTabBarModel> tabBarItems = [
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