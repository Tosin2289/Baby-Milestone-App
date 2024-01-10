import 'package:baby_milestone_app/src/views/home_page.dart';
import 'package:baby_milestone_app/src/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  await Hive.openBox("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby milestone app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final deviceStoreage = GetStorage();
  @override
  void initState() {
    next();
    super.initState();
  }

  next() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    deviceStoreage.writeIfNull("isFirstTime", true);
    deviceStoreage.read("isFirstTime") != true
        ? Get.to(() => const HomePage())
        : Get.to(const OnBoardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "Baby Milestone Tracker",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
