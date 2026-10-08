import 'package:flutter/material.dart';
import 'package:secret_decryption/data/helpers/notification_helper.dart';
import 'package:secret_decryption/presentation/views/decryption_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationHelper.initialize();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DecryptionView(),
    ),
  );
}