import 'package:flutter/material.dart';

import '../util/app_color_constants.dart';
import '../util/app_constants.dart';
// import '../util/app_constants.dart';

// ThemeData dark = ThemeData(
//   useMaterial3: false,
//   fontFamily: AppConstants.fontFamily,
//   primaryColor: const Color.fromARGB(255, 255, 0, 0),
//   secondaryHeaderColor: const Color(0xFF009f67),
//   disabledColor: const Color(0xffa2a7ad),
//   brightness: Brightness.dark,
//   hintColor: const Color(0xFFbebebe),
//   cardColor: const Color(0xFF30313C),
//   textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color.fromARGB(255, 255, 0, 0))),
//   colorScheme: const ColorScheme.dark(primary: Color.fromARGB(255, 255, 0, 0),
//       tertiary: Color(0xff6165D7),
//       tertiaryContainer: Color(0xff171DB6),
//       secondary: Color(0xFFFF8200)).copyWith(background: const Color(0xFF191A26)).copyWith(error: const Color(0xFFdd3135)),
// );

ThemeData dark = ThemeData(
  fontFamily: AppConstants.fontFamaliyNormal,
  useMaterial3: false,
  primaryColor: AppColorConstants.brightBlue,
  secondaryHeaderColor: const Color(0xFF009f67),
  disabledColor: const Color(0xffa2a7ad),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFbebebe),
  cardColor: const Color(0xFF30313C),
  textButtonTheme: TextButtonThemeData(
      style:
          TextButton.styleFrom(foregroundColor: AppColorConstants.brightBlue)),
  colorScheme: const ColorScheme.dark(
          primary: AppColorConstants.brightBlue,
          tertiary: Color(0xff6165D7),
          tertiaryContainer: Color(0xff171DB6),
          secondary: Color(0xFFFF8200))
      .copyWith(surfaceTint: const Color(0xFF191A26))
      .copyWith(error: const Color(0xFFdd3135)),
);
