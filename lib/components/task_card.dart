import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/controllers/task_controller.dart';
import 'package:goalie/models/task.dart';
import 'package:goalie/res/decor.dart';

import 'options_sheet.dart';

class TaskCard extends StatelessWidget {
  final taskController = Get.find<TaskController>();

  final Task task;
  final bool inDrag;
  TaskCard({
    Key? key,
    required this.task,
    this.inDrag = false,
  }) : super(key: key);

  void toggleCompleted(task) {
    taskController.updateTask(task.copyWith(completed: !task.completed));
    if (!taskController.updatedTasks.contains(task.id)) {
      taskController.updatedTasks.add(task.id);
    } else {
      taskController.updatedTasks.remove(task.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Card(
        elevation: inDrag ? 3 : 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: colorsList[task.color],
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () {
            toggleCompleted(task);
          },
          onLongPress: () async {
            await Get.bottomSheet(OptionsSheet(
              task,
              isTask: true,
            ));
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      activeColor: Theme.of(context).colorScheme.onSurface,
                      checkColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      value: task.completed,
                      onChanged: (_) {
                        toggleCompleted(task);
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        task.text,
                        style: TextStyle(
                          decoration: task.completed
                              ? TextDecoration.lineThrough
                              : null,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
