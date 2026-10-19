import 'package:task_master/app/domain/entities/task.dart';
import 'package:task_master/app/domain/enums/task_status.dart';

abstract class TaskRepository {
  List<Task> getTasks();

  List<Task> searchTasks(String query, {TaskStatus? status});

  Future<void> addTask(Task task);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(String id);
}
