import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void ShowSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

Future<File?> openCamera() async {
  ImagePicker impicker = ImagePicker();
  var image = await impicker.pickImage(source: ImageSource.camera);
  return File(image!.path);
}

Future<File?> openGallery() async {
  ImagePicker pic = ImagePicker();
  var image = await pic.pickImage(source: ImageSource.gallery);
  return File(image!.path);
}
