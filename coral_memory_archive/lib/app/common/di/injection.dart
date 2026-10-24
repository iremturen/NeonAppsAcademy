import 'package:coral_memory_archive/app/data/datasources/local/coral_memory_local_datasource.dart';
import 'package:coral_memory_archive/app/data/datasources/local/objectbox_database.dart';
import 'package:coral_memory_archive/app/data/repositories/coral_memory_repository.dart';
import 'package:coral_memory_archive/app/data/repositories/coral_memory_repository_impl.dart';
import 'package:coral_memory_archive/app/domain/usecases/coral_memory_usecases.dart';

class Injection {
  final ObjectBoxDatabase database;
  late final CoralMemoryLocalDataSource localDataSource;
  late final CoralMemoryRepository repository;

  late final GetAllMemories getAllMemories;
  late final GetMemoryById getMemoryById;
  late final SaveMemory saveMemory;
  late final UpdateMemory updateMemory;
  late final DeleteMemory deleteMemory;
  late final SearchMemories searchMemories;
  late final SaveAllMemories saveAllMemories;
  late final ClearAllMemories clearAllMemories;

  Injection(this.database) {
    _init();
  }

  void _init() {
    localDataSource = CoralMemoryLocalDataSource(
      database: database,
    );

    repository = CoralMemoryRepositoryImpl(
      localDataSource: localDataSource,
    );

    getAllMemories = GetAllMemories(
      repository: repository,
    );

    getMemoryById = GetMemoryById(
      repository: repository,
    );

    saveMemory = SaveMemory(
      repository: repository,
    );

    updateMemory = UpdateMemory(
      repository: repository,
    );

    deleteMemory = DeleteMemory(
      repository: repository,
    );

    searchMemories = SearchMemories(
      repository: repository,
    );

    saveAllMemories = SaveAllMemories(
      repository: repository,
    );

    clearAllMemories = ClearAllMemories(
      repository: repository,
    );
  }

  static Future<Injection> create() async {
    final database = await ObjectBoxDatabase.create();
    return Injection(database);
  }

  void dispose() {
    database.close();
  }
}
