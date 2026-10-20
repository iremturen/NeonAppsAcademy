import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/data/repositories/coral_memory_repository.dart';

class GetMemoryById {
  final CoralMemoryRepository repository;

  GetMemoryById({required this.repository});

  CoralMemoryFragment? call(int id) {
    return repository.getById(id);
  }
}