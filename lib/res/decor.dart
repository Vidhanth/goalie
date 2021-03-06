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
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
  },
);

//// ScrollBehaviour
class CustomScrollBehaviour extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}

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

// Goals

List<Color> colorsList = [
  Colors.deepPurple.shade200,
  Colors.deepOrange.shade200,
  Colors.red.shade200,
  Colors.green.shade200,
  Colors.blue.shade200,
  Colors.grey.shade500,
  Colors.brown.shade200,
  Colors.cyan.shade200,
  Colors.pink.shade200,
  Colors.teal.shade200,
];

// TasksScreen
