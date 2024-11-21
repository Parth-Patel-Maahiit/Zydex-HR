import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zydex_hr/components/common_image_picture.dart';
import 'package:zydex_hr/components/common_title_text.dart';
import 'package:zydex_hr/theme_controller.dart';
import 'package:zydex_hr/util/app_color_constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  "Drawer Content",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          backgroundColor: AppColorConstants.baseBG,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColorConstants.blue100.withOpacity(0.88),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const CommonImagePicture(
                    "assets/svg_icons/drawermenu-icon.svg",
                    color: AppColorConstants.white,
                    type: "SVG",
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            titleSpacing: 0,
            title: const CommonTitleText(
              title: "Home",
              color: AppColorConstants.white,
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.brightness_6,
                      color: AppColorConstants.white,
                    ),
                    onPressed: () {
                      Get.find<ThemeController>().toggleTheme();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
