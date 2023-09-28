import 'dart:io';

import 'package:file_picker/file_picker.dart';

uploadFile({
  bool isSvg = false,
}) async {
  FilePickerResult? res = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg == true
        ? [
            "svg",
            "SVG",
          ]
        : [
            "png",
            "PNG",
            'jpg',
            "jpeg",
          ],
  );
  if(res != null)
  {
    return File(res.files.single.path!);
  }else
  {
    return null;
  }
}
