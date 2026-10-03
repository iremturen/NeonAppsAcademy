import 'package:flutter/material.dart';

import 'package:titanic_passengers/constants/colors.dart';
import 'package:titanic_passengers/constants/dimensions.dart';
import 'package:titanic_passengers/presentation/models/custom_container_model.dart';
import 'package:titanic_passengers/presentation/models/custom_text_model.dart';
import 'package:titanic_passengers/presentation/pages/team_passengers_view.dart';
import 'package:titanic_passengers/presentation/widgets/custom_container.dart';
import 'package:titanic_passengers/presentation/widgets/custom_team_container.dart';
import 'package:titanic_passengers/presentation/widgets/custom_text.dart';
import 'package:titanic_passengers/data/enum/team.dart';
import 'package:titanic_passengers/data/passengers.dart';

class PassengersView extends StatelessWidget {
  const PassengersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                CustomText(
                  model: TextModel(
                    text: 'TITANIC PASSENGER LISTS',
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                    textAlign: TextAlign.center,
                  ),
                ),

                CustomText(
                  model: TextModel(
                    text: 'NEON ACADEMY PASSENGERS',
                    fontSize: subtitleFontSize,
                    color: darkBlue,
                    textAlign: TextAlign.center,
                  ),
                ),

                CustomContainer(
                  model: CustomContainerModel(
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(borderRadius),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      TeamContainer(
                        title: 'FLUTTER TEAM',
                        imagePath: 'assets/icons/flutter_icon.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamPassengersView(
                                title: 'FLUTTER',
                                passengers: passengers
                                    .where(
                                      (passenger) =>
                                          passenger.team == Team.flutter,
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: teamContainerSpacing),
                      TeamContainer(
                        title: 'iOS TEAM',
                        imagePath: 'assets/icons/apple_icon.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamPassengersView(
                                title: 'iOS',
                                passengers: passengers
                                    .where(
                                      (passenger) => passenger.team == Team.ios,
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: teamContainerSpacing),
                      TeamContainer(
                        title: 'ANDROID TEAM',
                        imagePath: 'assets/icons/android_icon.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamPassengersView(
                                title: 'ANDROID',
                                passengers: passengers
                                    .where(
                                      (passenger) =>
                                          passenger.team == Team.android,
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: teamContainerSpacing),
                      TeamContainer(
                        title: 'DESIGN TEAM',
                        imagePath: 'assets/icons/palette_icon.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamPassengersView(
                                title: 'DESIGN',
                                passengers: passengers
                                    .where(
                                      (passenger) =>
                                          passenger.team == Team.design,
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
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
