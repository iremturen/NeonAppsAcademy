import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/data/datasources/local/objectbox_database.dart';

class CoralMemoryLocalDataSource {
  final ObjectBoxDatabase database;

  CoralMemoryLocalDataSource({
    required this.database,
  });

  List<CoralMemoryFragment> getAll() {
    return database.store
        .box<CoralMemoryFragment>()
        .getAll();
  }

  CoralMemoryFragment? getById(int id) {
    return database.store
        .box<CoralMemoryFragment>()
        .get(id);
  }

  int insert(CoralMemoryFragment memory) {
    return database.store
        .box<CoralMemoryFragment>()
        .put(memory);
  }

  bool delete(int id) {
    return database.store
        .box<CoralMemoryFragment>()
        .remove(id);
  }
}