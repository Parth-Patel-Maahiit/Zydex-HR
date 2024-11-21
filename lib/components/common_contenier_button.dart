import 'package:flutter/material.dart';

import '../util/app_color_constants.dart';

class CommonContenierButton extends StatelessWidget {
  final String? text;
  final dynamic time;
  final double? fontSize;
  final Function() onTap;
  final bool isTextShow;
  final bool isOtherShow;
  final Widget? otherWidget;
  final bool isBold;
  final bool isExpanded;
  final double? padding;
  final Color backgroundColor;
  const CommonContenierButton({
    super.key,
    this.text,
    this.time,
    required this.onTap,
    this.fontSize,
    this.isTextShow = true,
    this.isOtherShow = false,
    this.otherWidget,
    this.isBold = false,
    this.isExpanded = false,
    this.backgroundColor = AppColorConstants.white,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding ?? 10),
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: AppColorConstants.border),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: time != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (isTextShow)
              Text(
                "$text",
                style: TextStyle(
                    color: AppColorConstants.contentSecondary,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    fontSize: fontSize ?? 16),
              ),
            if (isTextShow)
              if (time != null)
                Text(
                  "$time",
                  style: const TextStyle(
                      color: AppColorConstants.contentSecondary, fontSize: 16),
                ),
            if (isOtherShow)
              if (otherWidget != null)
                if (isExpanded) Expanded(child: otherWidget!) else otherWidget!
          ],
        ),
      ),
    );
  }
}
