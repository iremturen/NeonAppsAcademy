import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class SheriffDropdownButton extends StatelessWidget {
  const SheriffDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        final message = value == 'backup'
            ? 'Backup called! Deputies are on their way.'
            : 'Warning issued to the townspeople.';

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(
                    value == 'backup' ? Icons.shield : Icons.warning_amber,
                    color: westernGold,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      message,
                      style: GoogleFonts.inter(
                        color: parchment,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: darkLeather,
              elevation: 10,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: westernGold,
                  width: 2,
                ),
              ),
            ),
          );
      },
      color: darkLeather,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(
          color: westernGold,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 'backup',
            child: SizedBox(
              width: 202,
              child: Text(
                'Call for backup',
                style: TextStyle(color: parchment),
              ),
            ),
          ),
          const PopupMenuItem(
            value: 'warning',
            child: SizedBox(
              width: 202,
              child: Text(
                'Issue a warning',
                style: TextStyle(color: parchment),
              ),
            ),
          ),
        ];
      },
      child: Container(
        width: 270,
        height: 60,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: saddleBrown,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: desertSand,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              'SHERIFF ACTIONS',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}