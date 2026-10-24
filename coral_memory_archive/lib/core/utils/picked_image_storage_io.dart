import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<String> persistPickedImage(XFile image) async {
  final supportDirectory = await getApplicationSupportDirectory();
  final imageDirectory = Directory('${supportDirectory.path}/memory_images');
  await imageDirectory.create(recursive: true);

  final extension = image.name.contains('.')
      ? '.${image.name.split('.').last}'
      : '.jpg';
  final imageUri = Uri.tryParse(image.path);
  final sourceFile = imageUri?.scheme == 'file'
      ? File.fromUri(imageUri!)
      : File(image.path);
  final savedImage = await sourceFile.copy(
    '${imageDirectory.path}/${DateTime.now().microsecondsSinceEpoch}$extension',
  );

  return savedImage.path;
}
