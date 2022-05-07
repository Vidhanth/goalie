import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Global
//// Colors
const scaffoldDarkBackground = Color(0xff222222);
const scaffoldLightBackground = Color(0xfffcfcfc);
const accentColor = Color(0xff00C3A5);
const highlightColor = Colors.transparent;
const splashColor = Colors.white10;
const focusColor = Colors.white10;
const pageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  },
);

//// Text
final montserrat = GoogleFonts.montserratTextTheme(
  Get.textTheme,
);

//// ThemeData
final lightThemeData = ThemeData(
  scaffoldBackgroundColor: scaffoldLightBackground,
  textTheme: montserrat,
  splashColor: splashColor,
  highlightColor: highlightColor,
  focusColor: focusColor,
  pageTransitionsTheme: pageTransitionsTheme,
  colorScheme: const ColorScheme.light(
    secondary: accentColor,
  ),
);

final darkThemeData = ThemeData(
  scaffoldBackgroundColor: scaffoldDarkBackground,
  textTheme: montserrat,
  splashColor: splashColor,
  highlightColor: highlightColor,
  focusColor: focusColor,
  pageTransitionsTheme: pageTransitionsTheme,
  colorScheme: const ColorScheme.dark(
    secondary: accentColor,
  ),
);

// GoalsScreen

// TasksScreen
