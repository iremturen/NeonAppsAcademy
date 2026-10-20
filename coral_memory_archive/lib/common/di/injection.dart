import 'package:coral_memory_archive/data/datasources/local/coral_memory_local_datasource.dart';
import 'package:coral_memory_archive/data/datasources/local/objectbox_database.dart';
import 'package:coral_memory_archive/data/repositories/coral_memory_repository.dart';
import 'package:coral_memory_archive/data/repositories/coral_memory_repository_impl.dart';
import 'package:coral_memory_archive/domain/usecases/delete_memory.dart';
import 'package:coral_memory_archive/domain/usecases/get_all_memories.dart';
import 'package:coral_memory_archive/domain/usecases/save_memory.dart';

class Injection {
  final ObjectBoxDatabase database;
  late final CoralMemoryLocalDataSource localDataSource;
  late final CoralMemoryRepository repository;
  late final GetAllMemories getAllMemories;
  late final SaveMemory saveMemory;
  late final DeleteMemory deleteMemory;

  Injection._(this.database) {
    localDataSource = CoralMemoryLocalDataSource(
      database: database,
    );

    repository = CoralMemoryRepositoryImpl(
      localDataSource: localDataSource,
    );

    getAllMemories = GetAllMemories(
      repository: repository,
    );

    saveMemory = SaveMemory(
      repository: repository,
    );

    deleteMemory = DeleteMemory(
      repository: repository,
    );
  }

  static Future<Injection> create() async {
    final database = await ObjectBoxDatabase.create();
    return Injection._(database);
  }

  void dispose() {
    database.close();
  }
}