
import 'package:coral_memory_archive/data/repositories/coral_memory_repository.dart';

class DeleteMemory {
  final CoralMemoryRepository repository;

  DeleteMemory({required this.repository});

  bool call(int id) {
    return repository.delete(id);
  }
}