import '../enums/task_status.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime? deadline;
  final TaskStatus status;

  const Task({
    required this.id,
    required this.title,
    this.description = '',
    this.deadline,
    this.status = TaskStatus.pending,
  });

  Task copyWith({
    String? title,
    String? description,
    DateTime? deadline,
    TaskStatus? status,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      status: status ?? this.status,
    );
  }
}
