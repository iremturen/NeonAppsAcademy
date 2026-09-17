import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class BlacksmithControls extends StatefulWidget {
  const BlacksmithControls({super.key});

  @override
  State<BlacksmithControls> createState() => _BlacksmithControlsState();
}

class _BlacksmithControlsState extends State<BlacksmithControls> {
  bool isShopOpen = false;

  void toggleShop() {
    setState(() {
      isShopOpen = !isShopOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: toggleShop,
          style: ElevatedButton.styleFrom(
            backgroundColor: burntOrange,
            foregroundColor: parchment,
            minimumSize: const Size(270, 60),
            textStyle: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: westernGold,
                width: 2,
              ),
            ),
          ),
          child: Text(
            isShopOpen ? 'CLOSE BLACKSMITH SHOP' : 'OPEN BLACKSMITH SHOP',
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: isShopOpen ? () {} : null,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(270, 60),
            backgroundColor: darkLeather,
            foregroundColor: parchment,
            disabledBackgroundColor: disabledGray,
            disabledForegroundColor: disabledText,
            textStyle: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: desertSand,
                width: 2,
              ),
            ),
          ),
          child: const Text('USE BLACKSMITH TOOLS'),
        ),
      ],
    );
  }
}
