import 'package:baby_milestone_app/src/controller/milestone_controller.dart';
import 'package:flutter/material.dart';

class AddNewMileStonrScreen extends StatefulWidget {
  const AddNewMileStonrScreen({super.key});

  @override
  State<AddNewMileStonrScreen> createState() => _AddNewMileStonrScreenState();
}

class _AddNewMileStonrScreenState extends State<AddNewMileStonrScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  var controller = MilestoneController.instance;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Record New Milestone",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    radius: 80,
                    child: controller.imageFile == null
                        ? Center(
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.grey),
                              onPressed: () {
                                controller.pickedImageFileFromGallery();
                                setState(() {});
                              },
                            ),
                          )
                        : Image.file(controller.pickedFile.value!,
                            fit: BoxFit.cover)),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Milestone Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text("Select Date"),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () => _selectDate(context),
                        child: Text("${selectedDate.toLocal()}".split(' ')[0])),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descriptionController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Milestone Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        controller.addToList(
                            titleController.text,
                            descriptionController.text,
                            selectedDate.toLocal().toString(),
                            controller.pickedFile.value!);

                        Navigator.pop(context);
                      },
                      child: const Text("Record Milestone")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
