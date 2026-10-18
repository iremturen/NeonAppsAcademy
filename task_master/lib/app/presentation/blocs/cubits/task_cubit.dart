import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/app/data/repositories/task_repository.dart';
import '../../../domain/entities/task.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository repository;

  TaskCubit(this.repository) : super(TaskInitial());

  Future<void> loadTasks() async {
    emit(TaskLoading());

    try {
      final tasks = repository.getTasks();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<bool> addTask(Task task) async {
    try {
      await repository.addTask(task);
      emit(TaskLoaded(repository.getTasks()));
      return true;
    } catch (e) {
      emit(TaskError(e.toString()));
      return false;
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await repository.updateTask(task);
      emit(TaskLoaded(repository.getTasks()));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await repository.deleteTask(id);
      emit(TaskLoaded(repository.getTasks()));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
