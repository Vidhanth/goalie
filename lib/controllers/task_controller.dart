import 'package:get/get.dart';
import 'package:goalie/models/goal.dart';
import 'package:goalie/models/task.dart';
import 'package:goalie/utils/db_helper.dart';

class TaskController extends GetxController {
  int goalId;
  String goalTitle = "";

  late Goal parentGoal;

  TaskController(this.goalId);

  final dbHelper = DBHelper.instance;

  List<Task> tasksList = [];

  @override
  void onInit() async {
    parentGoal = await DBHelper.instance.getGoal(goalId);
    List<Task> tasks = await dbHelper.getAllTasks(goalId);
    if (parentGoal.customOrder!.isNotEmpty) {
      for (int id in parentGoal.customOrder!) {
        tasksList.add(tasks.singleWhere((task) => task.id == id));
      }
    } else {
      tasksList = tasks;
    }
    goalTitle = parentGoal.text;
    super.onInit();
    update();
  }

  void reorderTasks(List<Task> newTasks) async {
    tasksList = newTasks;
    update();
    await saveOrder();
  }

  Future<void> saveOrder() async {
    List<int> customOrder = [];
    for (Task task in tasksList) {
      customOrder.add(task.id!);
    }
    Goal goal = parentGoal.copyWith(customOrder: customOrder);
    await DBHelper.instance.updateGoal(goal);
  }

  void addTask(Task task) async {
    int id = await dbHelper.createTask(task);
    task = task.copyWith(id: id);
    tasksList.add(task);
    if (parentGoal.customOrder!.isNotEmpty) {
      parentGoal.customOrder!.add(task.id!);
      await dbHelper.updateGoal(parentGoal);
    }
    update();
  }

  void updateTask(Task task) async {
    await dbHelper.updateTask(task);
    tasksList[tasksList.indexWhere((oldTask) => oldTask.id == task.id)] = task;
    update();
  }

  void deleteTask(int id) async {
    await dbHelper.deleteTask(id);
    tasksList.removeWhere((task) => task.id == id);
    update();
    parentGoal.customOrder!.remove(id);
    await dbHelper.updateGoal(parentGoal);
  }
}
