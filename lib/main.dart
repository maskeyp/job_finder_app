import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/screens/signup/signup_screen.dart';

import 'controllers/auth_controller.dart';

import 'controllers/bottomNavBar_controller.dart';
import 'controllers/job_controller.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController = AuthController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green,
          scaffoldBackgroundColor: const Color.fromARGB(249, 245, 241, 241)),
      initialBinding: BindingsBuilder(() {
        Get.put<AuthController>(authController);
        Get.put<JobController>(JobController());
        Get.put<BottomNavBarController>(BottomNavBarController());
      }),
      home: Obx(() {
        if (authController.user == null) {
          // User is not logged in, show authentication screen
          return SignupScreen();
        } else {
          // User is logged in, show main screen
          return MainScreen();
        }
      }),
    );
  }
}
