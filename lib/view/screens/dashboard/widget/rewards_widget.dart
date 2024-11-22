import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/common_image_picture.dart';
import '../../../../components/common_title_text.dart';
import '../../../../util/app_color_constants.dart';
import '../../../../util/images.dart';

class RewardsWidget extends StatelessWidget {
  const RewardsWidget({
    super.key,
    required this.name,
    required this.date,
    required this.fromName,
    required this.image,
  });
  final String name;
  final String date;
  final String fromName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColorConstants.baseBlackWhite),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const CommonImagePicture(
                  Images.clapIcon,
                  size: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CommonImagePicture(
                    Icons.person,
                    color: AppColorConstants.iconColor,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    CommonTitleText(
                      title: "Well Done to $name",
                      color: AppColorConstants.textColor,
                      fontSize: 16,
                    ),
                    Text(
                      "by $fromName",
                      style: TextStyle(
                          color: AppColorConstants.textnormalColor,
                          fontSize: 12),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          color: AppColorConstants.textnormalColor,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
