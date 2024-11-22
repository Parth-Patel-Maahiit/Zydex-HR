import 'package:flutter/material.dart';
import 'package:zydex_hr/util/app_color_constants.dart';

class CommonTitleText extends StatelessWidget {
  final String title;
  final Color? color;
  final double fontSize;
  const CommonTitleText(
      {super.key, required this.title, this.color, this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fontSize,
          color: color ?? AppColorConstants.textColor,
          fontWeight: FontWeight.bold),
    );
  }
}
