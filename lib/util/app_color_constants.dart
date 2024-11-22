import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme_controller.dart';

class AppColorConstants {
  static const Color _baseBGLight = Color(0xFFF8F9FD);
  static const Color _baseBGDark = Color(0xFF121212);

  static const Color _textLight = Color(0xFF000000);
  static const Color _textDark = Color(0xFFFFFFFF);

  static const Color _buttonLight = Color(0xFF087CE7);
  static const Color _buttonDark = Color(0xFF333333);

  static const Color _iconLight = Color(0xFF000000);
  static const Color _iconDark = Color(0xFFFFFFFF);

  static const Color _borderLight = Color(0xFFE6E6E6);
  static const Color _borderDark = Color(0xFF444444);

  static const Color _hintTextLight = black40;
  static const Color _hintTextDark = Color.fromARGB(255, 187, 185, 185);

  static const Color _backGroundLight = Color(0xFFDDDDDD);
  static const Color _backGroundDark = Color(0xFF121212);

  static const Color _backGroundIconDark = Color.fromARGB(54, 221, 221, 221);
  static const Color _backGroundIconLight = Color.fromARGB(34, 18, 18, 18);

  // Dynamic Colors
  static Color get baseBG =>
      Get.find<ThemeController>().isDarkMode.value ? _baseBGDark : _baseBGLight;

  static Color get textColor =>
      Get.find<ThemeController>().isDarkMode.value ? _textDark : _textLight;

  static Color get buttonColor =>
      Get.find<ThemeController>().isDarkMode.value ? _buttonDark : _buttonLight;

  static Color get iconColor =>
      Get.find<ThemeController>().isDarkMode.value ? _iconDark : _iconLight;

  static Color get borderColor =>
      Get.find<ThemeController>().isDarkMode.value ? _borderDark : _borderLight;

  static Color get hintTextColor => Get.find<ThemeController>().isDarkMode.value
      ? _hintTextDark
      : _hintTextLight;

  static Color get baseBlackWhite =>
      Get.find<ThemeController>().isDarkMode.value
          ? Colors.black
          : Colors.white;

  static Color get backGround => Get.find<ThemeController>().isDarkMode.value
      ? _backGroundDark
      : _backGroundLight;

  static Color get backGroundIcon =>
      Get.find<ThemeController>().isDarkMode.value
          ? _backGroundIconDark
          : _backGroundIconLight;

  static Color get textnormalColor =>
      Get.find<ThemeController>().isDarkMode.value ? white80 : black80;

  //------------------- CORE COLOURS ------------------------//
  static const Color brightBlue = Color(0xFF087CE7);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  //-------------------- Content colours--------------------//
  static const Color ccntentTitle = Color(0xFF000000);
  static const Color contentSecondary = Color(0xFF6B6B6B);
  static const Color contentTertiary = Color(0xFF999999);
  static const Color contentWhite = Color(0xFFFFFFFF);

  //-------------------- Background colours ----------------------//F6F6F6
  static const Color bggrey = Color(0xFFF6F6F6);

  //-------------------- Green HUe colours ----------------------//
  static const Color blue100 = Color(0xFF087CE7);
  static const Color blue80 = Color(0xCC087CE7);
  static const Color blue60 = Color(0x99087CE7);
  static const Color blue40 = Color(0x66087CE7);
  static const Color blue20 = Color(0x33087CE7);
  static const Color blue10 = Color(0x1A087CE7);
  static const Color blue5 = Color(0x0D087CE7);

  //-------------------- Black HUe colours ---------------------//
  static const Color black100 = Color(0xFF000000);
  static const Color black80 = Color(0xCC000000);
  static const Color black60 = Color(0x99000000);
  static const Color black40 = Color(0x66000000);
  static const Color black20 = Color(0x33000000);
  static const Color black10 = Color(0x1A000000);
  static const Color black5 = Color(0x0D000000);

  //-------------------- white HUe colours ---------------------//
  static const Color white100 = Color(0xFFFFFFFF); // Fully opaque white
  static const Color white80 = Color(0xCCFFFFFF); // 80% opacity white
  static const Color white60 = Color(0x99FFFFFF); // 60% opacity white
  static const Color white40 = Color(0x66FFFFFF); // 40% opacity white
  static const Color white20 = Color(0x33FFFFFF); // 20% opacity white
  static const Color white10 = Color(0x1AFFFFFF); // 10% opacity white
  static const Color white5 = Color(0x0DFFFFFF); // 5% opacity white

  //-------------------- Sentiment colours ------------------//
  static const Color sentimentNegative = Color(0xFFC31E07);
  static const Color sentimentPositive = Color(0xFF09A158);
  static const Color sentimentWarning = Color(0xFFF9C50C);

  //------------------- Border colours --------------------//
  static const Color border = Color(0xFFE6E6E6);
  static const Color outline = Color(0xFFE6E6E6);
  static const Color separator = Color(0xFFE6E6E6);
  static const Color pageIndicator = Color(0xFFE8E8E8);
  static const Color inActiveButton = Color(0xFFD3D4D7);

  //------------------- Base colours ----------------------//
  static const Color base = Color(0xFFF8F9FD);
  static const Color green10 = Color(0x1A06C167);
  static const Color sentimentWarning10 = Color(0x1AF9C50C);
  static const Color sentimentWarning20 = Color(0x33F9C50C);
  static const Color transparent = Colors.transparent;

  //------------------- Icons colours ---------------------//
  static const Color icons = Color(0xFFB3B3B3);

  static const Color systemArea = Colors.black;
  static const Color appbar = Color.fromARGB(255, 39, 38, 38);
  static const Color bottomNavigation = Color.fromARGB(255, 39, 38, 38);
  static const Color icon = Colors.white;
  static const Color newProjectBoxColor = Color.fromARGB(255, 253, 120, 61);
  static const Color selectedItemColor = Colors.white;
  static const Color unselectedItemColor = Colors.grey;
  static Color textfieldBorderSide = Colors.white;
}
