import 'package:baby_milestone_app/src/controller/milestone_controller.dart';
import 'package:baby_milestone_app/src/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_new_milestone_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(MilestoneController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Baby's Milestone Tracker",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const AddNewMileStonrScreen();
                      },
                    ));
                  },
                  icon: const Icon(Icons.add, size: 25),
                ),
                const Text(
                  "Recent Milestones",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (controller.milestones.isNotEmpty)
              Obx(() {
                return Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: controller.milestones.length,
                      itemBuilder: (context, index) {
                        final data = controller.milestones[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailsScreen(
                                milestone: data,
                                color: Colors.primaries[index].shade300,
                              );
                            }));
                          },
                          child: Container(
                            height: 124,
                            decoration: BoxDecoration(
                                color: Colors.primaries[index].shade300,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        data.title.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        data.time.toString(),
                                        style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        data.description.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              })
            else
              const Center(
                child: Text(
                  "No Milestone Recorded yet",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
          ],
        ),
      ),
    );
  }
}
