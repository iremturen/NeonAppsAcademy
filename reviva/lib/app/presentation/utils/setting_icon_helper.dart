import 'package:flutter/material.dart';

IconData getSettingIcon(String title) {
  switch (title) {
    case 'Profile':
      return Icons.person_outline;
    case 'Payment':
      return Icons.credit_card_outlined;
    case 'Contact Us':
      return Icons.mail_outline;
    case 'Privacy Policy':
      return Icons.privacy_tip_outlined;
    case 'Terms of Service':
      return Icons.description_outlined;
    default:
      return Icons.settings_outlined;
  }
}