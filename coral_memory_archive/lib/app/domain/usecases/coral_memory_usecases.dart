import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/app/data/repositories/coral_memory_repository.dart';

class GetAllMemories {
  final CoralMemoryRepository repository;

  GetAllMemories({required this.repository});

  List<CoralMemoryFragment> call() {
    return repository.getAll();
  }
}

class GetMemoryById {
  final CoralMemoryRepository repository;

  GetMemoryById({required this.repository});

  CoralMemoryFragment? call(int id) {
    return repository.getById(id);
  }
}

class SaveMemory {
  final CoralMemoryRepository repository;

  SaveMemory({required this.repository});

  int call(CoralMemoryFragment memory) {
    return repository.save(memory);
  }
}

class UpdateMemory {
  final CoralMemoryRepository repository;

  UpdateMemory({required this.repository});

  int call(CoralMemoryFragment memory) {
    return repository.update(memory);
  }
}

class DeleteMemory {
  final CoralMemoryRepository repository;

  DeleteMemory({required this.repository});

  bool call(int id) {
    return repository.delete(id);
  }
}

class SearchMemories {
  final CoralMemoryRepository repository;

  SearchMemories({required this.repository});

  List<CoralMemoryFragment> call({
    String? query,
    DateTime? date,
    String? category,
  }) {
    return repository.search(
      query: query,
      date: date,
      category: category,
    );
  }
}

class SaveAllMemories {
  final CoralMemoryRepository repository;

  SaveAllMemories({required this.repository});

  List<int> call(List<CoralMemoryFragment> memories) {
    return repository.saveAll(memories);
  }
}

class ClearAllMemories {
  final CoralMemoryRepository repository;

  ClearAllMemories({required this.repository});

  int call() {
    return repository.deleteAll();
  }
}
