import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class SaloonSpecialsButton extends StatelessWidget {
  const SaloonSpecialsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 60,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 36,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/saloon.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.1,
                  ),
                  color: darkLeather,
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'DAILY SPECIALS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: parchment,
                      ),
                    ),
                    SizedBox(height: 28),
                    Divider(color: westernGold, thickness: 2),
                    SizedBox(height: 24),
                    Text(
                      'COWBOY STEAK                 18\$\n\n'
                      'DESERT BEANS                  9\$\n\n'
                      'FRONTIER BREAD                6\$\n\n'
                      'CAMPFIRE CHILI               12\$\n\n'
                      'SALOON APPLE PIE              8\$',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.3,
                        color: parchment,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: 270,
        height: 60,
        decoration: BoxDecoration(
          color: westernRust,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: dustyLeather,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.5, 1.0],
            colors: [
              westernRust,
              Color(0xFF7D2E20),
              deepRust,
            ],
          ),
          image: const DecorationImage(
            image: AssetImage('assets/images/saloon.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'DAILY SPECIALS',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}