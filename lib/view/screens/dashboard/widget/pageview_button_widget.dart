import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/common_image_picture.dart';
import '../../../../util/app_color_constants.dart';

class PageviewButtonWidget extends StatelessWidget {
  const PageviewButtonWidget(
      {super.key,
      this.borderRadius,
      this.onTap,
      required this.icon,
      required this.alignment});
  final BorderRadiusGeometry? borderRadius;
  final GestureTapCallback? onTap;
  final IconData icon;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Align(
        alignment: alignment,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 13),
            decoration: BoxDecoration(
                borderRadius: borderRadius ??
                    const BorderRadiusDirectional.horizontal(
                        end: Radius.circular(40)),
                color: AppColorConstants.backGroundIcon),
            child: CommonImagePicture(
                color: AppColorConstants.baseBlackWhite, icon),
          ),
        ),
      );
    });
  }
}
