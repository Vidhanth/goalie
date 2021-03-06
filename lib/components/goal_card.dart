import 'package:animated_progress_bar/animated_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/components/options_sheet.dart';
import 'package:goalie/controllers/goal_controller.dart';
import 'package:goalie/controllers/task_controller.dart';
import 'package:goalie/res/decor.dart';
import 'package:goalie/res/strings.dart';
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
        color: colorsList[goal.color],
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () async {
            Get.put(TaskController(goal.id!));
            await Get.toNamed('/tasks');
            Get.find<GoalController>().refreshGoals();
            Get.delete<TaskController>();
          },
          onLongPress: () async {
            await Get.bottomSheet(OptionsSheet(
              goal,
              isTask: false,
            ));
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        goal.text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      DateHelper.getDisplayDate(goal.createdAt!),
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                if (goal.totalTasks != null) ...[
                  AnimatedProgressBar(
                    radius: BorderRadius.circular(20),
                    height: 5,
                    bgColor: Colors.black12,
                    progressColor: Theme.of(context).colorScheme.onSurface,
                    value: goal.completedTasks! / goal.totalTasks!,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${(goal.completedTasks! / goal.totalTasks! * 100).truncate()}% $completedText',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                ] else
                  Text(
                    noTasksText,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
