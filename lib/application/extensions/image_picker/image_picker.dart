import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/image/image_convert.dart';

class ImagePickerExtensions {
  Future<File?> _pickImageFromGalley() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future callAlertGetImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => Platform.isIOS
          ? CupertinoAlertDialog(
              title: const Text('Select Image'),
              actions: [
                TextButton(
                  onPressed: () async {
                    final image = await _pickImageFromGalley();
                    if (image != null) {
                      String? imageConvert =
                          await ImageConvert().imageToBase64(image);
                      Navigator.pop(context, imageConvert);
                    }
                  },
                  child: const Text('Gallery'),
                ),
                TextButton(
                  onPressed: () async {
                    final image = await _pickImageFromCamera();
                    if (image != null) {
                      String? imageConvert =
                          await ImageConvert().imageToBase64(image);
                      Navigator.pop(context, imageConvert);
                    }
                  },
                  child: const Text('Camera'),
                ),
              ],
            )
          : AlertDialog(
              title: const Text('Select Image'),
              actions: [
                TextButton(
                  onPressed: () async {
                    final image = await _pickImageFromGalley();
                    if (image != null) {
                      String? imageConvert =
                          await ImageConvert().imageToBase64(image);
                      Navigator.pop(context, imageConvert);
                    }
                  },
                  child: const Text('Gallery'),
                ),
                TextButton(
                  onPressed: () async {
                    final image = await _pickImageFromCamera();
                    if (image != null) {
                      String? imageConvert =
                          await ImageConvert().imageToBase64(image);
                      Navigator.pop(context, imageConvert);
                    }
                  },
                  child: const Text('Camera'),
                ),
              ],
            ),
    );
  }
}
