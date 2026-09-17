import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/sheriff_dropdown_button.dart';
import '../widgets/saloon_specials_button.dart';
import '../widgets/vigilante_button.dart';
import '../widgets/blacksmith_controls.dart';
import '../widgets/bank_robbery_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background2.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                  color: parchment,
                  iconSize: 32,
                  style: IconButton.styleFrom(
                    backgroundColor: darkLeather,
                    side: const BorderSide(
                      color: westernGold,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SheriffDropdownButton(),
                const SizedBox(height: 24),
                const SaloonSpecialsButton(),
                const SizedBox(height: 24),
                const VigilanteButton(),
                const SizedBox(height: 24),
                const BlacksmithControls(),
                const SizedBox(height: 24),
                const BankRobberyButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
