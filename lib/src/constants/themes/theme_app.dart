import 'package:flutter/material.dart';
import 'package:notes/src/constants/constants.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorApp.white,
    colorScheme: const ColorScheme.light(
      primary: ColorApp.lightGrey,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorApp.blackDarker,
    colorScheme: const ColorScheme.dark(
      primary: ColorApp.lightGrey,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
