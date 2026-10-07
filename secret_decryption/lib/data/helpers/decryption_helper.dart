import 'dart:math';

class DecryptionHelper {
  static String generateEncryptedMessage() {
    final random = Random();

    return List.generate(
      6,
      (_) => random.nextInt(100).toString().padLeft(2, '0'),
    ).join(' ');
  }
}
