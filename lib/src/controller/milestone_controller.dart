import 'dart:io';

import 'package:baby_milestone_app/src/models/milestone.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class MilestoneController extends GetxController {
  static MilestoneController get instance => Get.find();
  final _mybox = Hive.box("myBox");
  List<Milestone> milestones = [];
  late Rx<File?> pickedFile;
  XFile? imageFile;
  pickedImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      Get.snackbar("Hurry", "You have sucessfully picked an image");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  void addToList(String title, String description, String time, File imgpath) {
    var newdata = Milestone(
        title: title, description: description, image: imgpath, time: time);
    milestones.add(newdata);
    updateDataBase();
  }

  void loadData() {
    milestones = _mybox.get("Milestones");
  }

// this is to update the database
  void updateDataBase() {
    _mybox.put("Milestones", milestones);
  }
}
