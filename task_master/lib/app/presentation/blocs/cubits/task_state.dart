import '../../../../../app/domain/entities/task.dart';
import '../../../../../app/domain/enums/task_status.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  final String searchQuery;
  final TaskStatus? statusFilter;
  final bool hasAnyTasks;

  TaskLoaded(
    this.tasks, {
    this.searchQuery = '',
    this.statusFilter,
    this.hasAnyTasks = true,
  });
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}
