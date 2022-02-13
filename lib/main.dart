import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:goalie/routes/tasks_screen.dart';

import 'routes/goals_screen.dart';

void main() {
  runApp(const GoalieApp());
}

class GoalieApp extends StatelessWidget {
  const GoalieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const GoalsScreen(),
        '/tasks': (context) => const TasksScreen(),
      },
    );
  }
}
