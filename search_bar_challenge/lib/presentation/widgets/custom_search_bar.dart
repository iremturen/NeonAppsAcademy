import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_bar_challenge/constants/colors.dart';
import 'package:search_bar_challenge/constants/dimension.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: GoogleFonts.commissioner(
        color: black,
        fontSize: searchBarFontSize,
      ),
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: red, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: red, width: 2),
        ),
      ),
    );
  }
}
