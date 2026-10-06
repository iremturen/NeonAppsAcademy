import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String destinationKey = 'destination';
  static const String hasVisitedKey = 'hasVisited';
  static const String visitCountKey = 'visitCount';

  static Future<void> saveTrip({
    required String destination,
    required bool hasVisited,
    required int visitCount,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(destinationKey, destination);
    await prefs.setBool(hasVisitedKey, hasVisited);
    await prefs.setInt(visitCountKey, visitCount);
  }

  static Future<String?> getDestination() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(destinationKey);
  }

  static Future<bool?> getHasVisited() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(hasVisitedKey);
  }

  static Future<int?> getVisitCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(visitCountKey);
  }
  
}