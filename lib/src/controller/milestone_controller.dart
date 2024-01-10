import 'dart:io';

import 'package:baby_milestone_app/src/models/milestone.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MilestoneController extends GetxController {
  static MilestoneController get instance => Get.find();
  RxList<Milestone> milestones = <Milestone>[].obs;
  late Rx<File?> pickedFile;
  XFile? imageFile;
  pickedImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      Get.snackbar("Hurry", "You have sucessfully picked an image");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  addToList(String title, String description, String time, File imgpath) {
    milestones.add(Milestone(
        title: title, description: description, image: imgpath, time: time));
  }
}
