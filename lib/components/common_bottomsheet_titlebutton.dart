import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zydex_hr/util/app_color_constants.dart';

import 'common_button.dart';
import 'common_title_text.dart';

class CommonBottomSheetTitleButton extends StatelessWidget {
  final Widget content;
  final String title;
  final Function()? onTap;
  final bool visible;
  final Color? buttonColor;
  final String? buttontitle;
  const CommonBottomSheetTitleButton(
      {super.key,
      required this.content,
      required this.title,
      this.onTap,
      this.visible = true,
      this.buttonColor,
      this.buttontitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorConstants.white,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CommonTitleText(
            title: title,
          ),
          const SizedBox(
            height: 10,
          ),
          content,
          if (visible)
            Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: CommonButton(
                buttonColor: buttonColor,
                title: buttontitle ?? "save".tr,
                onTap: visible ? onTap ?? () {} : () {},
              ),
            ),
        ],
      ),
    );
  }
}
