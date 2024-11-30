import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class DrawerControllerGet extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();

  void showDrawer() {
    advancedDrawerController.showDrawer();
  }
}
