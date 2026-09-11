import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:dream_destinations/service/preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = PreferencesService();

  final savedPlaceName = await preferences.getString('placeName');
  final savedVisitCount = await preferences.getInt('visitCount');
  final savedVisitedBefore = await preferences.getBool('visitedBefore');

  // await preferences.clearPreferences();

  if (savedPlaceName == null &&
      savedVisitCount == null &&
      savedVisitedBefore == null) {
    print('--- First run: enter your dream destination ---');

    stdout.write('What is the name of the place you want to visit? ');
    stdout.flush();
    final placeName = stdin.readLineSync()?.trim() ?? '';

    final visitedBefore = askVisitedBefore();
    final visitCount = askVisitCount();

    await preferences.saveString('placeName', placeName);
    await preferences.saveInt('visitCount', visitCount);
    await preferences.saveBool('visitedBefore', visitedBefore);
  } else {
    print('--- Restart: reading saved destination ---');
  }

  print('What is the name of the place?: ${await preferences.getString('placeName')}');
  print('Have you been to this place before?: ${await preferences.getBool('visitedBefore')}');
  print('How many times have you visited this place?: ${await preferences.getInt('visitCount')}');
}

bool askVisitedBefore() {
  while (true) {
    stdout.write('Have you been there before? (Yes/No): ');
    stdout.flush();
    final answer = stdin.readLineSync()?.trim().toLowerCase();

    if (answer == 'yes') return true;
    if (answer == 'no') return false;

    print('Please type Yes or No.');
  }
}

int askVisitCount() {
  while (true) {
    stdout.write('How many times have you visited this place? ');
    stdout.flush();
    final visitCount = int.tryParse(stdin.readLineSync()?.trim() ?? '');

    if (visitCount != null && visitCount >= 0) return visitCount;

    print('Please enter a non-negative whole number.');
  }
}
