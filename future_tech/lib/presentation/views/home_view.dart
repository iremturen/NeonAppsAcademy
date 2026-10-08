import 'package:flutter/material.dart';

import 'package:future_tech/data/devices.dart';
import 'package:future_tech/presentation/widgets/custom_device_card.dart';
import 'package:future_tech/presentation/widgets/custom_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeader(),
                  const SizedBox(height: 30),
                  Expanded(
                    child: GridView.builder(
                      itemCount: devices.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 0.75,
                          ),
                      itemBuilder: (context, index) {
                        final device = devices[index];

                        return CustomDeviceCard(
                          imagePath: device.imagePath,
                          deviceName: device.deviceName,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
