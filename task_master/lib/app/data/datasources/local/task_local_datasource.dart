import 'package:hive/hive.dart';

import '../../models/task_model.dart';

class TaskLocalDataSource {
  final Box<TaskModel> taskBox;

  TaskLocalDataSource(this.taskBox);

  List<TaskModel> getTasks() {
    return taskBox.values.toList();
  }

  Future<void> addTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> updateTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> deleteTask(String id) async {
    await taskBox.delete(id);
  }
}