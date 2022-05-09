import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalie/components/color_picker.dart';
import 'package:goalie/components/confirm_sheet.dart';
import 'package:goalie/components/sheet.dart';
import 'package:goalie/controllers/goal_controller.dart';
import 'package:goalie/controllers/task_controller.dart';
import 'package:goalie/models/goal.dart';
import 'package:goalie/models/task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class OptionsSheet extends StatelessWidget {
  final bool isTask;
  final dynamic object;

  const OptionsSheet(
    this.object, {
    required this.isTask,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: _buildOptionsColumn(context),
      ),
    );
  }

  _buildOptionsColumn(BuildContext context) {
    String taskOrGoal = isTask ? "Task" : "Goal";
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOption(
          'Edit',
          LineIcons.edit,
          () async {
            Get.back();
            await Get.bottomSheet(Sheet(
              title: object.text,
              onSubmit: (text) async {
                if (isTask) {
                  Task updatedTask = object.copyWith(text: text);
                  Get.find<TaskController>().updateTask(updatedTask);
                } else {
                  Goal updatedGoal = object.copyWith(text: text);
                  Get.find<GoalController>().updateGoal(updatedGoal);
                }
              },
            ));
          },
        ),
        _buildOption(
          'Delete',
          LineIcons.trash,
          () async {
            Get.back();
            bool confirmDelete = await Get.bottomSheet(
                  ConfirmSheet(
                      title: "Delete $taskOrGoal?",
                      message: "This cannot be undone"),
                ) ??
                false;
            if (confirmDelete) {
              if (isTask) {
                Get.find<TaskController>().deleteTask(object.id);
              } else {
                Get.find<GoalController>().deleteGoal(object.id);
              }
            }
          },
        ),
        const SizedBox(
          height: 2,
        ),
        ColorPicker(
          onColorSelected: (index) {
            if (isTask) {
              Task task = object.copyWith(color: index);
              Get.find<TaskController>().updateTask(task);
            } else {
              Goal goal = object.copyWith(color: index);
              Get.find<GoalController>().updateGoal(goal);
            }
            Get.back();
          },
          selectedIndex: object.color,
        ),
      ],
    );
  }

  Widget _buildOption(String title, IconData icon, Function onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        onTap.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Get.theme.colorScheme.onBackground,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Get.theme.colorScheme.onBackground,
                )),
          ],
        ),
      ),
    );
  }
}
