import 'dart:io';

import 'package:flutter/material.dart';

Widget localFileImage({
  required String path,
  required double? width,
  required double? height,
  required BoxFit fit,
  required Widget Function() errorBuilder,
}) {
  final fileUri = Uri.tryParse(path);
  final file = fileUri?.scheme == 'file' ? File.fromUri(fileUri!) : File(path);

  return Image.file(
  file,
  width: width,
  height: height,
  fit: fit,
  errorBuilder: (context, error, stackTrace) {
    debugPrint('Could not load saved memory image at $path: $error');
    return errorBuilder();
  },
  );
}
