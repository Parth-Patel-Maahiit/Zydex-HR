import 'package:flutter/material.dart';
import 'package:zydex_hr/util/app_color_constants.dart';

import '../util/styles.dart';
import 'common_image_picture.dart';

class CommonTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? errorText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final String? counterText;
  final TextStyle? textFieldStyle;
  final double? vertical;
  final double? horizontal;
  final Function()? onTap;
  final bool? readOnly;
  final bool isLoading;
  final bool obscureText;
  final bool isPrfixIConShow;
  final bool? enableInteractiveSelection;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? enabledBorder;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  const CommonTextFiled(
      {super.key,
      required this.controller,
      this.onChanged,
      this.hintText,
      this.errorText,
      this.prefixIcon,
      this.suffixIcon,
      this.textFieldStyle,
      this.vertical,
      this.onTap,
      this.readOnly,
      this.focusedBorder,
      this.horizontal,
      this.enabledBorder,
      this.keyboardType,
      this.decoration,
      this.maxLines = 1,
      this.maxLength,
      this.enableInteractiveSelection,
      this.focusNode,
      this.isPrfixIConShow = false,
      this.isLoading = false,
      this.obscureText = false,
      this.counterText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      obscureText: obscureText,
      maxLines: maxLines,
      enableInteractiveSelection: enableInteractiveSelection ?? true,
      style: textFieldStyle ??
          const TextStyle(
              fontSize: 16.0, height: 1.2, color: AppColorConstants.black),
      cursorHeight: 20,
      maxLength: maxLength,
      cursorColor: AppColorConstants.blue100,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      decoration: decoration ??
          InputDecoration(
              errorText: errorText,
              counterText: counterText,
              filled: true,
              fillColor: AppColorConstants.white,
              focusColor: AppColorConstants.white,
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColorConstants.border)),
              contentPadding: EdgeInsets.symmetric(
                vertical: vertical ?? 14,
                horizontal: horizontal ?? 0.0,
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColorConstants.sentimentNegative)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColorConstants.sentimentNegative)),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColorConstants.blue100)),
              prefixIcon: prefixIcon != null
                  ? isPrfixIConShow
                      ? Container(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                color: AppColorConstants.blue10,
                                borderRadius: BorderRadius.circular(30)),
                            child: CommonImagePicture(
                              "$prefixIcon",
                              size: 16,
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(13),
                          child: CommonImagePicture(
                            "$prefixIcon",
                            size: 16,
                          ),
                        )
                  : null,
              suffixIcon: isLoading
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      height: 5,
                      width: 5,
                      child: const CircularProgressIndicator(
                        strokeWidth: 4, // Adjust this value to change the size
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColorConstants.blue100),
                      ))
                  : suffixIcon,
              hintText: hintText,
              hintStyle: textNormaGrey16),
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
