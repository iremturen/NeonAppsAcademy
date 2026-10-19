import 'package:hive/hive.dart';

import '../../../domain/enums/task_status.dart';
import '../../models/task_model.dart';

class TaskLocalDataSource {
  final Box<TaskModel> taskBox;

  TaskLocalDataSource(this.taskBox);

  List<TaskModel> getTasks() {
    return taskBox.values.toList();
  }

  List<TaskModel> searchTasks(String query, {TaskStatus? status}) {
    final normalizedQuery = query.trim().toLowerCase();

    return taskBox.values.where((task) {
      final matchesTitle =
          normalizedQuery.isEmpty ||
          task.title.toLowerCase().contains(normalizedQuery);
      final matchesStatus = status == null || task.status == status;
      return matchesTitle && matchesStatus;
    }).toList();
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
