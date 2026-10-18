import 'package:hive/hive.dart';

import '../../domain/entities/task.dart';
import '../../domain/enums/task_status.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime? deadline;

  @HiveField(4)
  final TaskStatus status;

  const TaskModel({
    required this.id,
    required this.title,
    this.description = '',
    this.deadline,
    this.status = TaskStatus.pending,
  });

  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      deadline: task.deadline,
      status: task.status,
    );
  }

  Task toEntity() {
    return Task(
      id: id,
      title: title,
      description: description,
      deadline: deadline,
      status: status,
    );
  }
}
