import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
