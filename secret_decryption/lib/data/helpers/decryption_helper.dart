import 'dart:math';

class DecryptionHelper {
  static String generateEncryptedMessage() {
    final random = Random();

    return List.generate(
      6,
      (_) => random.nextInt(100).toString().padLeft(2, '0'),
    ).join(' ');
  }

  static String generateSecurityCode() {
    final random = Random();

    return (1000 + random.nextInt(9000)).toString();
  }

  static bool validateSecurityCode({
    required String enteredCode,
    required String securityCode,
  }) {
    return enteredCode == securityCode;
  }
}
