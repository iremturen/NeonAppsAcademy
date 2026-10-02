import 'package:flutter/material.dart';
import 'package:picker_challenge/constants/colors.dart';
import 'package:picker_challenge/constants/dimensions.dart';
import 'package:picker_challenge/presentation/models/custom_text_model.dart';
import 'package:picker_challenge/presentation/widgets/custom_text.dart';
import 'package:picker_challenge/presentation/models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: height * 0.65,
          child: Image(
            image: user.image,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),

        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  user.color.withValues(alpha: 0.65),
                  user.color,
                ],
                stops: const [0.0, 0.32, 0.56, 0.72],
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 36, right: 12, bottom: 60, top:12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  model: CustomTextModel(
                    text: user.name,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: grey,
                    fontFamily: user.fontFamily,
                  ),
                ),
                CustomText(
                  model: CustomTextModel(
                    text: '${user.age} years old',
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: grey,
                    fontFamily: user.fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
