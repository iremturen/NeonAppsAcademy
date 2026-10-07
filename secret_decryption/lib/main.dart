import 'package:flutter/material.dart';
import 'package:secret_decryption/presentation/views/decryption_view.dart';

void main() {
  runApp(const SecretDecryptionApp());
}

class SecretDecryptionApp extends StatelessWidget {
  const SecretDecryptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secret Decryption',
      home: const DecryptionView(),
    );
  }
}