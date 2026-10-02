import 'package:flutter/material.dart';
import 'package:picker_challenge/presentation/models/custom_tabbar_model.dart';

const List<CustomTabBarModel> tabBarItems = [
  CustomTabBarModel(
    icon: Icons.person_rounded,
    title: 'Profile',
  ),
  CustomTabBarModel(
    icon: Icons.photo_library_rounded,
    title: 'Photo',
  ),
  CustomTabBarModel(
    icon: Icons.text_fields_rounded,
    title: 'Font',
  ),
  CustomTabBarModel(
    icon: Icons.calendar_month_rounded,
    title: 'Age',
  ),
  CustomTabBarModel(
    icon: Icons.palette_rounded,
    title: 'Color',
  ),
];