import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/colors.dart';

class FormTextField extends StatelessWidget {
  final String hintText;
  final Color textColor;
  final TextInputType keyboardType;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;

  const FormTextField({
    super.key,
    required this.hintText,
    required this.textColor,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.validator,
    this.maxLength,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = GoogleFonts.fredoka(
      color: textColor,
      fontWeight: FontWeight.bold,
    ).merge(textStyle);

    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      maxLength: maxLength,
      style: baseTextStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: baseTextStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: parchment, width: 1.5),
        ),
        errorStyle: GoogleFonts.fredoka(
          color: blue,
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: lightBlue, width: 2),
        ),
      ),
    );
  }
}
