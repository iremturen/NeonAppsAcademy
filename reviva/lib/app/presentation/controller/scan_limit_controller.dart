import 'package:shared_preferences/shared_preferences.dart';

class ScanLimitController {
  static const int initialScanLimit = 2;
  static const String _remainingScansKey = 'remaining_scans';

  Future<int> getRemainingScans() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getInt(_remainingScansKey) ?? initialScanLimit;
  }

  Future<bool> useScan() async {
    final preferences = await SharedPreferences.getInstance();
    final remainingScans = await getRemainingScans();

    if (remainingScans <= 0) {
      return false;
    }

    await preferences.setInt(
      _remainingScansKey,
      remainingScans - 1,
    );

    return true;
  }

  Future<void> addScan() async {
    final preferences = await SharedPreferences.getInstance();
    final remainingScans = await getRemainingScans();

    await preferences.setInt(
      _remainingScansKey,
      remainingScans + 1,
    );
  }
}