import 'package:coral_memory_archive/app/data/datasources/local/coral_memory_local_datasource.dart';
import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/app/data/repositories/coral_memory_repository.dart';

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
  int update(CoralMemoryFragment memory) {
    return localDataSource.update(memory);
  }

  @override
  List<int> saveAll(List<CoralMemoryFragment> memories) {
    return localDataSource.insertMany(memories);
  }

  @override
  bool delete(int id) {
    return localDataSource.delete(id);
  }

  @override
  int deleteAll() {
    return localDataSource.deleteAll();
  }

  @override
  int count() {
    return localDataSource.count();
  }

  @override
  List<CoralMemoryFragment> search({
    String? query,
    DateTime? date,
    String? category,
  }) {
    return localDataSource.search(
      query: query,
      date: date,
      category: category,
    );
  }
}
