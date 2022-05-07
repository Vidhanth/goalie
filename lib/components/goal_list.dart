import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/controllers/goal_controller.dart';
import 'package:goalie/models/goal.dart';

import 'goal_card.dart';

class GoalList extends StatelessWidget {
  final goalsController = Get.find<GoalController>();

  GoalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return goalsController.goalsList.isEmpty
          ? FadeIn(
              duration: 500.milliseconds,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
                  child: Opacity(
                    opacity: Get.isDarkMode ? 0.85 : 1,
                    child: Image.asset(
                      'assets/images/no_goals.png',
                      height: Get.height * 0.2,
                    ),
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: goalsController.goalsList.length,
              itemBuilder: (context, index) {
                Goal goal = goalsController.goalsList[index];
                return GoalCard(goal: goal);
              },
            );
    });
  }
}
