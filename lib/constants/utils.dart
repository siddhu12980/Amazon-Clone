import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

// ignore: non_constant_identifier_names
void ShowSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

Future<List<File>> pickImages() async {
  List<File> images = [];

  try {
    var files = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);

    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    print(e.toString());
  }

  return images;
}
