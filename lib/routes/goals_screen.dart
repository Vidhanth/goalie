import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/components/add_sheet.dart';
import 'package:goalie/components/button.dart';
import 'package:goalie/components/goal_list.dart';
import 'package:goalie/controllers/goal_controller.dart';
import 'package:goalie/models/goal.dart';
import 'package:goalie/res/strings.dart';
import 'package:goalie/utils/settings_helper.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        titleSpacing: 20.0,
        elevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            child: IconButton(
              splashRadius: 24.0,
              onPressed: SettingsHelper.instance.toggleTheme,
              icon: Icon(
                Get.isDarkMode
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ],
        title: Text(
          goalsTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Button(
          text: addGoalBtnText,
          onPressed: () {
            Get.bottomSheet(
              AddSheet(
                title: 'Enter Goal',
                onSubmit: (goal, selectedColor) {
                  if (goal.isNotEmpty) {
                    Goal newGoal = Goal(text: goal, color: selectedColor);
                    Get.find<GoalController>().addGoal(newGoal);
                  }
                },
              ),
            );
          },
        ),
      ),
      body: GoalList(),
    );
  }
}
