import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static Future<void> shareApp({
    required String appName,
    required String storeUrl,
  }) async {
    await SharePlus.instance.share(
      ShareParams(
        text: '$appName\n$storeUrl',
      ),
    );
  }
}