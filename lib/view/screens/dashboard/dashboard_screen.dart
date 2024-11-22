import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zydex_hr/components/common_button.dart';
import 'package:zydex_hr/components/common_image_picture.dart';
import 'package:zydex_hr/components/common_title_text.dart';
import 'package:zydex_hr/theme_controller.dart';
import 'package:zydex_hr/util/app_color_constants.dart';
import 'package:zydex_hr/util/dimensions.dart';
import 'package:zydex_hr/util/images.dart';

import '../../../components/common_badges.dart';
import 'widget/pageview_button_widget.dart';
import 'widget/rewards_widget.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final PageController _pageViewController = PageController();

  final List<Rewards> rewards = [
    Rewards(
        name: "Harsh Jadav",
        date: "11 oct 2024",
        fromName: "Parth Patel",
        image: ""),
    Rewards(
        name: "keyur patel",
        date: "11 oct 2024",
        fromName: "Parth Patel",
        image: ""),
    Rewards(
        name: "Nirav Darjee",
        date: "11 oct 2024",
        fromName: "Parth Patel",
        image: "")
  ];

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
          backgroundColor: AppColorConstants.backGround,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColorConstants.blue100.withOpacity(0.88),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const CommonImagePicture(
                    Images.drawermenuIcon,
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
                  const CommonBadges(
                    labeltext: "99+",
                    imageName: Images.taskIcon,
                  ),
                  const CommonBadges(
                    labeltext: "99+",
                    imageName: Images.notificationIcon,
                  ),
                ],
              ),
            ],
            bottom: appbarBottom(context),
          ),
          body: Column(
            children: [
              commonTitleAndButton(
                  title: "Rewards & Recognitions", buttonName: "View All"),
              SizedBox(
                height: 100,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    PageView(
                      controller: _pageViewController,
                      children: <Widget>[
                        for (int i = 0; i < rewards.length; i++)
                          RewardsWidget(
                            name: rewards[i].name,
                            image: rewards[i].image,
                            date: rewards[i].date,
                            fromName: rewards[i].fromName,
                          ),
                      ],
                    ),
                    PageviewButtonWidget(
                      alignment: Alignment.centerLeft,
                      icon: Icons.arrow_back_ios_new_outlined,
                      onTap: () {
                        int currentPage =
                            _pageViewController.page?.round() ?? 0;
                        if (currentPage > 0) {
                          _pageViewController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                    PageviewButtonWidget(
                      alignment: Alignment.centerRight,
                      icon: Icons.arrow_forward_ios_rounded,
                      borderRadius: const BorderRadiusDirectional.horizontal(
                          start: Radius.circular(40)),
                      onTap: () {
                        int currentPage =
                            _pageViewController.page?.round() ?? 0;
                        if (currentPage < 2) {
                          _pageViewController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              commonTitleAndButton(
                  title: "Your Time & Attendance", buttonName: "View All"),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColorConstants.baseBlackWhite),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CommonImagePicture(
                              Images.timepassingIcon,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CommonTitleText(
                                  title: "9.5",
                                  fontSize: 22,
                                ),
                                Text(
                                  "Spent Today",
                                  style: TextStyle(
                                      color: AppColorConstants.textnormalColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "2 Absences in this month",
                          style: TextStyle(
                              color: AppColorConstants.textnormalColor,
                              fontSize: 12),
                        ),
                        Text(
                          "2182.00 Maternity Leaves Avilable",
                          style: TextStyle(
                              color: AppColorConstants.textnormalColor,
                              fontSize: 12),
                        ),
                        Text(
                          "No Other Leaves avilable",
                          style: TextStyle(
                              color: AppColorConstants.textnormalColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      children: [
                        CommonButton(
                            title: "Apply Leave",
                            buttonColor: AppColorConstants.sentimentPositive,
                            width: Dimensions.screenwidth * 0.35,
                            vertical: 5,
                            borderRadius: 40,
                            fontSize: 14,
                            textcolor: AppColorConstants.black100,
                            onTap: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        CommonButton(
                            title: "Regularize",
                            buttonColor: AppColorConstants.sentimentNegative,
                            vertical: 5,
                            width: Dimensions.screenwidth * 0.35,
                            borderRadius: 40,
                            fontSize: 14,
                            onTap: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        CommonButton(
                            title: "Apply Outdoor",
                            textcolor: AppColorConstants.black100,
                            buttonColor: AppColorConstants.sentimentWarning,
                            vertical: 4,
                            width: Dimensions.screenwidth * 0.35,
                            borderRadius: 40,
                            fontSize: 14,
                            onTap: () {}),
                      ],
                    )
                  ],
                ),
              ),
              commonTitleAndButton(
                  title: "Your Learning Summary", buttonName: "View All"),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColorConstants.baseBlackWhite,
                ),
                child: Row(
                  children: [
                    commonLearningItem(
                        image: Images.rewardIcon,
                        count: "6",
                        title: "Modules are Completed"),
                    commonLearningItem(
                        image: Images.tasklistIcon,
                        count: "146",
                        title: "Total Modules To Do"),
                    commonLearningItem(
                        isSVG: false,
                        image: Images.modulesdoneIcon,
                        count: "4.11%",
                        size: 30,
                        title: "Modules Done Percentage"),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget commonLearningItem(
      {required String title,
      required String count,
      required String image,
      double size = 40,
      bool isSVG = true}) {
    return Expanded(
      child: Column(
        children: [
          CommonImagePicture(
            type: isSVG ? "SVG" : "",
            image,
            size: size,
            color: AppColorConstants.blue80,
          ),
          CommonTitleText(title: count),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColorConstants.textnormalColor, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget commonTitleAndButton(
      {required String title, String? buttonName, Function()? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonTitleText(
            title: title,
            color: AppColorConstants.textColor,
            fontSize: 16,
          ),
          if (buttonName != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                buttonName,
                style: const TextStyle(
                    color: AppColorConstants.blue100, fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }

  PreferredSize appbarBottom(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
            color: AppColorConstants.baseBlackWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const CommonImagePicture(
                        Images.pressIcon,
                        size: 40,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        CommonTitleText(
                          title: "Punch In",
                          fontSize: 16,
                          color: AppColorConstants.textColor,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              "Last swipe: ",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColorConstants.textnormalColor),
                            ),
                            const Text(
                              "11 jun 2020",
                              style: TextStyle(
                                color: AppColorConstants.blue100,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "Current Location",
                          style: TextStyle(
                              color: AppColorConstants.blue100, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.horizontal(
                            start: Radius.circular(40)),
                        color: AppColorConstants.blue100.withOpacity(0.88)),
                    child: const Row(
                      children: [
                        Text(
                          "Punch In",
                          style: TextStyle(
                              color: AppColorConstants.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CommonImagePicture(
                          Images.rightarrowIcon,
                          size: 20,
                          color: AppColorConstants.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

class Rewards {
  String name;
  String date;
  String fromName;
  String image;

  Rewards({
    required this.name,
    required this.date,
    required this.fromName,
    required this.image,
  });
}
