import 'package:image_picker/image_picker.dart';

import 'picked_image_storage_web.dart'
    if (dart.library.io) 'picked_image_storage_io.dart'
    as platform;

Future<String> persistPickedImage(XFile image) =>
    platform.persistPickedImage(image);
