import 'package:flutter/material.dart';
import 'package:gktodo/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = List<Task>();
  TaskData() {
    // dropTable();
    // truncateTable();
    refreshTasks();
  }

  Future<Database> get database async {
    Future<Database> db = openDatabase(
      join(await getDatabasesPath(), 'gktodo.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER)",
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> refreshTasks() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    List<Task> taskList = List.generate(maps.length, (i) {
      return Task(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['isDone'],
      );
    });
    tasks = taskList;
    notifyListeners();
  }

  int get taskCount {
    return tasks != null ? tasks.length : 0;
  }

  int get completedTaskCount {
    return tasks != null ? tasks.where((e) => e.isDone == 1).length : 0;
  }

  Future<void> addTask(String taskTitle) async {
    if (taskTitle != null) {
      int id = 0;
      tasks.forEach((element) {
        id = element.taskId > id ? element.taskId : id;
      });
      final task = Task(id + 1, taskTitle, 0);
      final Database db = await database;
      Map map = task.toMap();
      await db.insert('tasks', map,
          conflictAlgorithm: ConflictAlgorithm.replace);
      tasks.add(task);
      notifyListeners();
    }
  }

  Future<void> updateTask(Task task) async {
    final Database db = await database;
    task.isDone = task.isDone == 1 ? 0 : 1;
    await db.update('tasks', task.toMap(),
        where: 'id=${task.taskId}',
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    final Database db = await database;
    await db.delete('tasks', where: 'id=${task.taskId}');
    tasks.remove(task);
    notifyListeners();
  }

  void dropTable() async {
    final Database db = await database;
    db.execute("DROP TABLE tasks");
  }

  void truncateTable() async {
    final Database db = await database;
    db.execute("DELETE FROM tasks");
  }
}
