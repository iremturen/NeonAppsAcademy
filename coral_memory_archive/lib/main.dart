import 'package:flutter/material.dart';
import 'package:coral_memory_archive/app/app.dart';
import 'package:coral_memory_archive/app/common/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final injection = await Injection.create();

  runApp(
    CoralMemoryApp(injection: injection),
  );
}