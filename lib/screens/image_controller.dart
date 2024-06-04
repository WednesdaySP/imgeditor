import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:imgeditor/screens/Dialog_Box.dart';

class ImageController extends GetxController {
  var selectedImage = Rxn<File>();

  Future<void> getImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print('Image selected: ${pickedImage.path}');
      // Crop the selected image
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [CropAspectRatioPreset.original],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.teal,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Image',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      if (croppedImage != null) {
        print('Image cropped: ${croppedImage.path}');
        selectedImage.value = File(croppedImage.path);
      } else {
        print('Image cropping cancelled');
        selectedImage.value = File(pickedImage.path);
      }

      // Show the dialog
      if (selectedImage.value != null) {
        print('Showing dialog with image: ${selectedImage.value!.path}');
        Get.dialog(DialogBox(image: selectedImage.value));
      } else {
        print('No image to show in dialog');
      }
    } else {
      print('No image selected');
    }
  }
}
