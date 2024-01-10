import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MilestoneController extends GetxController {
  static MilestoneController get instance => Get.find();
  late Rx<File?> pickedFile;
  XFile? imageFile;
  pickedImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      Get.snackbar("Hurry", "You have sucessfully picked an image");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }
}
