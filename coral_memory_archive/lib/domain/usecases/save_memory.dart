import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/data/repositories/coral_memory_repository.dart';

class SaveMemory {
  final CoralMemoryRepository repository;

  SaveMemory({required this.repository});

  int call(CoralMemoryFragment memory) {
    return repository.save(memory);
  }
}