import 'package:get/get.dart';
import 'package:goalie/models/goal.dart';
import 'package:goalie/utils/db_helper.dart';

class GoalController extends GetxController {
  final dbHelper = DBHelper.instance;

  var goalsList = [].obs;

  @override
  void onInit() async {
    refreshGoals();
    super.onInit();
  }

  void refreshGoals() async {
    goalsList(await dbHelper.getAllGoals());
  }

  void addGoal(Goal goal) async {
    int id = await dbHelper.createGoal(goal);
    goal = goal.copyWith(id: id);
    goalsList.insert(0, goal);
  }

  void deleteGoal(int id) async {
    await dbHelper.deleteGoal(id);
    goalsList.removeWhere((goal) => goal.id == id);
  }

  void updateGoal(Goal goal) async {
    await dbHelper.updateGoal(goal);
    goalsList[goalsList.indexWhere((oldGoal) => oldGoal.id == goal.id)] = goal;
    update();
  }
}
