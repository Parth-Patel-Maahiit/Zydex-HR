import 'package:flutter/material.dart';

import '../util/app_color_constants.dart';
import '../util/app_constants.dart';
// import '../util/app_constants.dart';

// ThemeData light = ThemeData(
//   useMaterial3: false,
//   fontFamily: AppConstants.fontFamily,
//   primaryColor: Color.fromARGB(255, 255, 0, 0),
//   secondaryHeaderColor: const Color(0xFF1ED7AA),
//   disabledColor: const Color(0xFFBABFC4),
//   brightness: Brightness.light,
//   hintColor: const Color(0xFF9F9F9F),
//   cardColor: Colors.white,
//   textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 255, 0, 0))),
//   colorScheme: const ColorScheme.light(primary: Color.fromARGB(255, 255, 0, 0),
//       tertiary: Color(0xff6165D7),
//       tertiaryContainer: Color(0xff171DB6),
//       secondary: Color.fromARGB(255, 255, 0, 0)).copyWith(background: const Color(0xFFF3F3F3)).copyWith(error: const Color(0xFFE84D4F)),

// );
ThemeData light = ThemeData(
  fontFamily: AppConstants.fontFamaliyNormal,
  useMaterial3: false,
  primaryColor: AppColorConstants.brightBlue,
  secondaryHeaderColor: const Color(0xFF1ED7AA),
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
      style:
          TextButton.styleFrom(foregroundColor: AppColorConstants.brightBlue)),
  colorScheme: const ColorScheme.light(
          primary: AppColorConstants.brightBlue,
          tertiary: Color(0xff6165D7),
          tertiaryContainer: Color(0xff171DB6),
          secondary: AppColorConstants.brightBlue)
      // ignore: deprecated_member_use
      .copyWith(background: const Color(0xFFF3F3F3))
      .copyWith(error: const Color(0xFFE84D4F)),
);
