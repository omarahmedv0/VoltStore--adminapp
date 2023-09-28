// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:image_picker/image_picker.dart';

uploadImage() async {
  final XFile? picker = await ImagePicker.platform
      .getImageFromSource(source: ImageSource.gallery);

  if (picker != null) {
    return File(picker.path);
  } else {
    return null;
  }
}
