import 'package:flutter/material.dart';

class AddNewMileStonrScreen extends StatelessWidget {
  const AddNewMileStonrScreen({super.key});

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
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.grey),
                        onPressed: () {},
                      ),
                    )),
                const SizedBox(
                  height: 50,
                ),
                TextField(
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
                const Text(""),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 50,
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
                      onPressed: () {}, child: const Text("Record Milestone")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
