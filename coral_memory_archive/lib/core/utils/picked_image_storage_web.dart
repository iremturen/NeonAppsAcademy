import 'dart:convert';

import 'package:image_picker/image_picker.dart';

Future<String> persistPickedImage(XFile image) async {
  final bytes = await image.readAsBytes();
  final mimeType = image.mimeType ?? 'image/jpeg';
  return 'data:$mimeType;base64,${base64Encode(bytes)}';
}
