import 'package:flutter/material.dart';
import 'package:zydex_hr/util/app_color_constants.dart';

class CommonTitleText extends StatelessWidget {
  final String title;
  final Color? color;
  const CommonTitleText({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 20,
          color: color ?? AppColorConstants.textColor,
          fontWeight: FontWeight.bold),
    );
  }
}
