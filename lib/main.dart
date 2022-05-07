import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:goalie/controllers/goal_controller.dart';
import 'package:goalie/res/decor.dart';
import 'package:goalie/routes/tasks_screen.dart';
import 'package:goalie/utils/settings_helper.dart';

import 'routes/goals_screen.dart';

void main() async {
  await GetStorage.init();
  await SettingsHelper.instance.initializeSettings();
  Get.put(GoalController());
  runApp(const GoalieApp());
}

class GoalieApp extends StatelessWidget {
  const GoalieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:
          SettingsHelper.instance.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: darkThemeData,
      theme: lightThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const GoalsScreen(),
        '/tasks': (context) => TasksScreen(),
      },
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: child!,
          ),
        );
      },
    );
  }
}
