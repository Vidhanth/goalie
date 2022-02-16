import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/task.dart';
import '../models/goal.dart';

class DBHelper {
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  // Global
  static const _fileName = 'goalie.db';
  static const _goalsTable = 'goals';
  static const _tasksTable = 'tasks';
  static const id = 'id';

  // goals.db
  static const goalText = 'text';
  static const goalCustomOrder = 'custom_order';
  static const goalColorIndex = 'color';
  static const goalCreatedDate = 'created_at';

  // tasks.db
  static const taskText = 'text';
  static const taskGoalId = 'goal_id';
  static const taskCompleted = 'completed';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, _fileName),
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      create table $_goalsTable (
        $id integer primary key,
        $goalText text not null,
        $goalColorIndex int not null,
        $goalCreatedDate timestamp default CURRENT_TIMESTAMP
      )
    ''');
    await db.execute('''
      create table $_tasksTable (
        $id integer primary key,
        $taskText text not null,
        $taskCompleted boolean default false
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getAllGoals() async {
    Database db = await instance.database;
    return await db.query(_goalsTable);
  }

  Future<int> createGoal(Goal goal) async {
    Database db = await instance.database;
    int createdId = await db.insert(_goalsTable, goal.toMap());
    return createdId;
  }

  Future<int> updateGoal(Goal goal) async {
    Database db = await instance.database;
    int rowsAffected = await db.update(
      _goalsTable,
      goal.toMap(),
      where: "$id = ?",
      whereArgs: [goal.id],
    );
    return rowsAffected;
  }

  Future<int> deleteGoal(int goalId) async {
    Database db = await instance.database;
    int deletedId =
        await db.delete(_goalsTable, where: "$id = ?", whereArgs: [goalId]);
    return deletedId;
  }

  Future<List<Map<String, dynamic>>> getAllTasks(int goalId) async {
    Database db = await instance.database;
    return await db
        .query(_tasksTable, where: "$taskGoalId = ?", whereArgs: [goalId]);
  }

  Future<int> createTask(Task task) async {
    Database db = await instance.database;
    int createdId = await db.insert(_tasksTable, task.toMap());
    return createdId;
  }

  Future<int> updateTask(Task task) async {
    Database db = await instance.database;
    int rowsAffected = await db.update(
      _tasksTable,
      task.toMap(),
      where: "$id = ?",
      whereArgs: [task.id],
    );
    return rowsAffected;
  }

  Future<int> deleteTask(int taskId) async {
    Database db = await instance.database;
    int deletedId =
        await db.delete(_tasksTable, where: "$id = ?", whereArgs: [taskId]);
    return deletedId;
  }
}
