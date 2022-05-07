import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/components/task_card.dart';
import 'package:goalie/controllers/task_controller.dart';
import 'package:goalie/models/task.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

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
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.only(top: 0, bottom: 10),
              items: taskController.tasksList,
              itemBuilder: (context, animation, Task task, index) {
                return Reorderable(
                  key: ValueKey(task.id),
                  builder: (context, anim, inDrag) => SizeFadeTransition(
                    sizeFraction: 0.7,
                    curve: Curves.easeInOut,
                    animation: animation,
                    child: Handle(
                      delay: const Duration(milliseconds: 100),
                      child: TaskCard(task: task, inDrag: inDrag),
                    ),
                  ),
                );
              },
              areItemsTheSame: (Task a, Task b) => a.id == b.id,
              onReorderFinished:
                  (Task task, int from, int to, List<Task> newItems) {
                taskController.reorderTasks(newItems);
              },
            );
    });
  }
}
