import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/screens/profile/profile_screen.dart';

import '../controllers/bottomNavBar_controller.dart';
import 'favorite/favorite_screen.dart';
import 'home/home_screen.dart';
import '../widgets/bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  final BottomNavBarController bottomNavBarController =
      Get.find<BottomNavBarController>();

  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (Get.find<BottomNavBarController>().currentIndex.value) {
          case 0:
            return HomeScreen();
          case 1:
            return FavoriteScreen();
          case 2:
            return Container();
          case 3:
            return ProfileScreen();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
