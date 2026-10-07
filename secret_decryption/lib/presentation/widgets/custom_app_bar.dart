import 'package:flutter/material.dart';

import 'package:secret_decryption/constants/colors.dart';
import 'package:secret_decryption/constants/dimensions.dart';
import 'package:secret_decryption/presentation/models/custom_text_model.dart';
import 'package:secret_decryption/presentation/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16,),
          CustomText(
            model: CustomTextModel(
              text: 'SECRET DECRYPTION',
              fontSize: appBarTitleFontSize,
              fontWeight: FontWeight.bold,
              color: blue,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 4,),
          CustomText(
            model: CustomTextModel(
              text: 'SECURE GOVERNMENT TERMINAL',
              fontSize: appBarSubtitleFontSize,
              fontWeight: FontWeight.w500,
              color: neonGreen.withValues(alpha: 0.7),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      backgroundColor: bg1,
      toolbarHeight: appBarHeight,
    );
  }
}