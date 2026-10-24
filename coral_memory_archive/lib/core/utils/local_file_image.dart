import 'package:flutter/material.dart';

import 'local_file_image_web.dart'
    if (dart.library.io) 'local_file_image_io.dart'
    as platform;

Widget localFileImage({
  required String path,
  required double? width,
  required double? height,
  required BoxFit fit,
  required Widget Function() errorBuilder,
}) => platform.localFileImage(
  path: path,
  width: width,
  height: height,
  fit: fit,
  errorBuilder: errorBuilder,
);
