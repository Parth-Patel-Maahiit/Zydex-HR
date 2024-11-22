import 'package:flutter/material.dart';

import '../util/app_color_constants.dart';
import 'common_image_picture.dart';

class CommonBadges extends StatelessWidget {
  const CommonBadges(
      {super.key,
      required this.labeltext,
      this.size = 30,
      this.color,
      this.child,
      this.isLabelVisible = true,
      this.imageName,
      this.onTap});
  final String labeltext;
  final dynamic imageName;
  final double size;
  final Color? color;
  final Widget? child;
  final bool isLabelVisible;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Badge(
          padding: const EdgeInsets.symmetric(vertical: 5),
          isLabelVisible: isLabelVisible,
          label: Text(
            labeltext,
            style: TextStyle(
                color: color ?? AppColorConstants.white, fontSize: 10),
          ),
          child: child ??
              CommonImagePicture(
                imageName,
                color: AppColorConstants.white,
                size: size,
                type: "SVG",
              ),
        ),
      ),
    );
  }
}
