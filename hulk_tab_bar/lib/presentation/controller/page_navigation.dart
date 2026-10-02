import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/presentation/pages/home_view.dart';
import 'package:hulk_tab_bar/presentation/pages/mission_view.dart';
import 'package:hulk_tab_bar/presentation/pages/power_view.dart';
import 'package:hulk_tab_bar/presentation/pages/settings.view.dart';

class PageNavigation {
  static const List<Widget> pages = [
    HomeContent(),
    PowerView(),
    MissionView(),
    SettingsView(),
  ];
}