import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/components/confirm_sheet.dart';
import 'package:goalie/controllers/goal_controller.dart';
import 'package:goalie/controllers/task_controller.dart';
import 'package:goalie/utils/date_helper.dart';

import '../models/goal.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;
  const GoalCard({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.purple.shade200,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () async {
            Get.put(TaskController(goal.id!));
            await Get.toNamed('/tasks');
            Get.delete<TaskController>();
          },
          onLongPress: () async {
            if (await Get.bottomSheet(
                  const ConfirmSheet(
                    title: "Delete this Goal?",
                    message: "This cannot be undone.",
                  ),
                ) ??
                false) {
              Get.find<GoalController>().deleteGoal(goal.id!);
            }
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateHelper.getDisplayDate(goal.createdAt!),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
