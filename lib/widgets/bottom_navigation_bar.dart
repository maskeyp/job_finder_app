import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottomNavBar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTabIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24,
              height: 24,
              color: controller.currentIndex.value == 0
                  ? Colors.blue
                  : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/fav.png',
              width: 24,
              height: 24,
              color: controller.currentIndex.value == 1
                  ? Colors.blue
                  : Colors.grey,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/notification.png',
              width: 24,
              height: 24,
              color: controller.currentIndex.value == 2
                  ? Colors.blue
                  : Colors.grey,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user.png',
              width: 24,
              height: 24,
              color: controller.currentIndex.value == 3
                  ? Colors.blue
                  : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
