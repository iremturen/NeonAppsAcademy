import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reviva/app/data/service/image_picker_service.dart';

class PhotoPickerController extends ChangeNotifier {
  final ImagePickerService _imagePickerService = ImagePickerService();

  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  Future<void> pickImage(ImageSource source) async {
    final image = await _imagePickerService.pickImage(source);

    if (image == null) return;

    _selectedImage = File(image.path);
    notifyListeners();
  }
}