import 'package:coral_memory_archive/presentation/cubit/coral_memory_state.dart';
import 'package:coral_memory_archive/presentation/cubit/enum/coral_memory_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/domain/usecases/get_all_memories.dart';
import 'package:coral_memory_archive/domain/usecases/save_memory.dart';
import 'package:coral_memory_archive/domain/usecases/delete_memory.dart';

class CoralMemoryCubit extends Cubit<CoralMemoryState> {
  final GetAllMemories _getAllMemories;
  final SaveMemory _saveMemory;
  final DeleteMemory _deleteMemory;

  CoralMemoryCubit({
    required GetAllMemories getAllMemories,
    required SaveMemory saveMemory,
    required DeleteMemory deleteMemory,
  })  : _getAllMemories = getAllMemories,
        _saveMemory = saveMemory,
        _deleteMemory = deleteMemory,
        super(const CoralMemoryState());

  void loadMemories() {
    emit(
      CoralMemoryState(
        status: CoralMemoryStatus.loading,
        memories: state.memories,
      ),
    );

    try {
      final memories = _getAllMemories();

      emit(
        CoralMemoryState(
          status: CoralMemoryStatus.success,
          memories: memories,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void saveMemory(CoralMemoryFragment memory) {
    emit(
      CoralMemoryState(
        status: CoralMemoryStatus.loading,
        memories: state.memories,
      ),
    );

    try {
      _saveMemory(memory);
      final memories = _getAllMemories();

      emit(
        CoralMemoryState(
          status: CoralMemoryStatus.success,
          memories: memories,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void deleteMemory(int id) {
    emit(
      CoralMemoryState(
        status: CoralMemoryStatus.loading,
        memories: state.memories,
      ),
    );

    try {
      _deleteMemory(id);
      final memories = _getAllMemories();

      emit(
        CoralMemoryState(
          status: CoralMemoryStatus.success,
          memories: memories,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void _emitError(Object error) {
    emit(
      CoralMemoryState(
        status: CoralMemoryStatus.error,
        memories: state.memories,
        errorMessage: error.toString(),
      ),
    );
  }
}