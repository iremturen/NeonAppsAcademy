import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/app/data/repositories/task_repository.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/enums/task_status.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository repository;
  String _searchQuery = '';
  TaskStatus? _statusFilter;

  TaskCubit(this.repository) : super(TaskInitial());

  Future<void> loadTasks() async {
    emit(TaskLoading());

    try {
      _emitFilteredTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void searchTasks(String query) {
    _searchQuery = query;
    try {
      _emitFilteredTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void filterByStatus(TaskStatus? status) {
    _statusFilter = status;
    try {
      _emitFilteredTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void _emitFilteredTasks() {
    final tasks = repository.searchTasks(_searchQuery, status: _statusFilter);
    final hasAnyTasks = tasks.isNotEmpty || repository.getTasks().isNotEmpty;
    emit(
      TaskLoaded(
        tasks,
        searchQuery: _searchQuery,
        statusFilter: _statusFilter,
        hasAnyTasks: hasAnyTasks,
      ),
    );
  }

  Future<bool> addTask(Task task) async {
    try {
      await repository.addTask(task);
      _emitFilteredTasks();
      return true;
    } catch (e) {
      emit(TaskError(e.toString()));
      return false;
    }
  }

  Future<bool> updateTask(Task task) async {
    try {
      await repository.updateTask(task);
      _emitFilteredTasks();
      return true;
    } catch (e) {
      emit(TaskError(e.toString()));
      return false;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await repository.deleteTask(id);
      _emitFilteredTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
