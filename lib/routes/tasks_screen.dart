import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/components/add_sheet.dart';
import 'package:goalie/components/button.dart';
import 'package:goalie/components/task_list.dart';
import 'package:goalie/controllers/task_controller.dart';
import 'package:goalie/models/task.dart';
import 'package:goalie/res/strings.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  final taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        titleSpacing: 20.0,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashRadius: 24.0,
          onPressed: () {
            Get.back();
          },
          iconSize: 40,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        title: Text(
          tasksTitle,
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
          text: addTaskBtnText,
          onPressed: () {
            Get.bottomSheet(
              AddSheet(
                title: 'Enter Task',
                onSubmit: (taskTitle, selectedColor) {
                  if (taskTitle.isNotEmpty) {
                    Task newTask = Task(
                      goalId: taskController.goalId,
                      text: taskTitle,
                      color: selectedColor,
                    );
                    taskController.addTask(newTask);
                  }
                },
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: GetBuilder<TaskController>(
              builder: (taskController) => Text(
                taskController.goalTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          const Expanded(child: TaskList()),
        ],
      ),
    );
  }
}
