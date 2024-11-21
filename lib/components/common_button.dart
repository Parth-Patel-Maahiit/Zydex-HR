import 'package:flutter/material.dart';
import 'package:zydex_hr/util/app_color_constants.dart';

import 'common_image_picture.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final String? imagePath;
  final Function() onTap;
  final bool isActive;
  final Color? buttonColor;
  final bool isLoding;
  final double borderRadius;
  final double horizontal;
  final double vertical;
  const CommonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isActive = true,
    this.isLoding = false,
    this.buttonColor,
    this.imagePath,
    this.borderRadius = 10,
    this.vertical = 15,
    this.horizontal = 15,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor ??
                (isActive
                    ? AppColorConstants.brightBlue
                    : AppColorConstants.inActiveButton),
            borderRadius: BorderRadius.circular(borderRadius)),
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            if (imagePath != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CommonImagePicture(
                        "$imagePath",
                        size: 16,
                      ),
                      const SizedBox(
                        width: 7,
                      )
                    ],
                  ),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isActive
                              ? AppColorConstants.white
                              : AppColorConstants.contentSecondary),
                    ),
                  ),
                ],
              ),
            if (imagePath == null)
              isLoding
                  ? const SizedBox(
                      height: 23,
                      width: 23,
                      child: CircularProgressIndicator(
                        strokeWidth: 4, // Adjust this value to change the size
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColorConstants.white),
                      ),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isActive
                              ? AppColorConstants.white
                              : AppColorConstants.contentSecondary),
                    ),
          ],
        ),
      ),
    );
  }
}
