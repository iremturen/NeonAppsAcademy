import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );

      if (!launched) {
        throw Exception('Could not launch URL');
      }
    } catch (_) {}
  }
}