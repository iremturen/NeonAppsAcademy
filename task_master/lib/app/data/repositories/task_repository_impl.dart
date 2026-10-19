import 'package:task_master/app/data/repositories/task_repository.dart';

import '../../domain/entities/task.dart';
import '../../domain/enums/task_status.dart';
import '../datasources/local/task_local_datasource.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  List<Task> getTasks() {
    return localDataSource.getTasks().map((model) => model.toEntity()).toList();
  }

  @override
  List<Task> searchTasks(String query, {TaskStatus? status}) {
    return localDataSource
        .searchTasks(query, status: status)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> addTask(Task task) async {
    final taskModel = TaskModel.fromEntity(task);
    await localDataSource.addTask(taskModel);
  }

  @override
  Future<void> updateTask(Task task) async {
    final taskModel = TaskModel.fromEntity(task);
    await localDataSource.updateTask(taskModel);
  }

  @override
  Future<void> deleteTask(String id) async {
    await localDataSource.deleteTask(id);
  }
}
