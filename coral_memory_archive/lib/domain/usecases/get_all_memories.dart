import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/data/repositories/coral_memory_repository.dart';

class GetAllMemories {
  final CoralMemoryRepository repository;

  GetAllMemories({required this.repository});

  List<CoralMemoryFragment> call() {
    return repository.getAll();
  }
}