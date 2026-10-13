import 'package:flutter/material.dart';
import 'package:hero_game/app/common/constants/dimensions.dart';

class ResponsiveHelper {
  static double screenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width *
        AppDimensions.screenWidthFactor;
  }
}