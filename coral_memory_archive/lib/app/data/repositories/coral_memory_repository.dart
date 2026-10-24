import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';

abstract class CoralMemoryRepository {
  List<CoralMemoryFragment> getAll();

  CoralMemoryFragment? getById(int id);

  int save(CoralMemoryFragment memory);

  int update(CoralMemoryFragment memory);

  List<int> saveAll(List<CoralMemoryFragment> memories);

  bool delete(int id);

  int deleteAll();

  int count();

  List<CoralMemoryFragment> search({
    String? query,
    DateTime? date,
    String? category,
  });
}
