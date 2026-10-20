import 'package:coral_memory_archive/data/datasources/local/coral_memory_local_datasource.dart';
import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/data/repositories/coral_memory_repository.dart';

class CoralMemoryRepositoryImpl implements CoralMemoryRepository {
  final CoralMemoryLocalDataSource localDataSource;

  CoralMemoryRepositoryImpl({
    required this.localDataSource,
  });

  @override
  List<CoralMemoryFragment> getAll() {
    return localDataSource.getAll();
  }

  @override
  CoralMemoryFragment? getById(int id) {
    return localDataSource.getById(id);
  }

  @override
  int save(CoralMemoryFragment memory) {
    return localDataSource.insert(memory);
  }

  @override
  bool delete(int id) {
    return localDataSource.delete(id);
  }
}