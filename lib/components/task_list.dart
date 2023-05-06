import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/components/task_card.dart';
import 'package:goalie/controllers/task_controller.dart';
import 'package:goalie/models/task.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (taskController) {
      return taskController.tasksList.isEmpty
          ? FadeIn(
              duration: 500.milliseconds,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
                  child: Opacity(
                    opacity: Get.isDarkMode ? 0.85 : 1,
                    child: Image.asset(
                      'assets/images/no_tasks.png',
                      height: Get.height * 0.2,
                    ),
                  ),
                ),
              ),
            )
          : ImplicitlyAnimatedReorderableList<Task>(
              items: taskController.tasksList,
              itemBuilder: (context, animation, item, i) {
                return Reorderable(
                  key: Key(
                    item.id.toString(),
                  ),
                  child: Handle(child: TaskCard(task: item)),
                );
              },
              areItemsTheSame: (task, other) => task.id == other.id,
              onReorderFinished: (task, from, to, newTasks) {
                taskController.reorderTasks(newTasks);
              },
            );
    });
  }
}
