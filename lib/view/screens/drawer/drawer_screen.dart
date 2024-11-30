import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:zydex_hr/components/common_image_picture.dart';
import 'package:zydex_hr/util/app_color_constants.dart';
import 'package:zydex_hr/view/screens/drawer/drawer_controller.dart';

import '../../../util/images.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final drawerController = Get.put(DrawerControllerGet());
    return SafeArea(
      child: AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: AppColorConstants.blue100),
        ),
        controller: drawerController.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        openRatio: 0.7,
        openScale: 0.9,
        drawer: Column(
          children: [
            Row(
              children: [
                const CommonImagePicture(
                  Icons.settings,
                  color: AppColorConstants.white,
                ),
                Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Images.demoImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const CommonImagePicture(
                  Icons.power_settings_new_outlined,
                  color: AppColorConstants.white,
                ),
              ],
            ),
          ],
        ),
        child: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: drawerController.advancedDrawerController,
          builder: (context, value, _) {
            return Stack(
              children: [
                child,
                if (value.visible)
                  Container(
                    color: const Color.fromARGB(190, 0, 0, 0), // Overlay color
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
