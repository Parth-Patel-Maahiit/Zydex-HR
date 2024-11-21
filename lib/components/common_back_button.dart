import 'package:flutter/material.dart';
import 'package:zydex_hr/util/app_color_constants.dart';

import 'common_image_picture.dart';

class CommonBackButoon extends StatelessWidget {
  const CommonBackButoon({super.key, this.data, this.onTap});
  final dynamic data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap ??
            () {
              Navigator.of(context).pop(data);
            },
        icon: CommonImagePicture(
          Icons.arrow_back,
          color: AppColorConstants.baseBlackWhite,
          size: 16,
        ));
  }
}
