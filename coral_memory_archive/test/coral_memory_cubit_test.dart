import 'dart:io';
import 'package:coral_memory_archive/app/data/datasources/local/coral_memory_local_datasource.dart';
import 'package:coral_memory_archive/app/data/datasources/local/objectbox_database.dart';
import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/app/data/repositories/coral_memory_repository_impl.dart';
import 'package:coral_memory_archive/app/domain/usecases/coral_memory_usecases.dart';
import 'package:coral_memory_archive/objectbox.g.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_cubit.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory tempDir;
  late Store store;
  late CoralMemoryCubit cubit;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('aqualis_cubit_test_');
    store = Store(getObjectBoxModel(), directory: tempDir.path);
    final database = ObjectBoxDatabase(store);
    final localDs = CoralMemoryLocalDataSource(database: database);
    final repo = CoralMemoryRepositoryImpl(localDataSource: localDs);

    cubit = CoralMemoryCubit(
      getAllMemories: GetAllMemories(repository: repo),
      saveMemory: SaveMemory(repository: repo),
      deleteMemory: DeleteMemory(repository: repo),
      updateMemory: UpdateMemory(repository: repo),
      searchMemories: SearchMemories(repository: repo),
      saveAllMemories: SaveAllMemories(repository: repo),
      clearAllMemories: ClearAllMemories(repository: repo),
    );
  });

  tearDown(() {
    cubit.close();
    store.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  test('Initial state is initial and empty', () {
    expect(cubit.state.status, CoralMemoryStatus.initial);
    expect(cubit.state.memories, isEmpty);
  });

  test('loadMemories loads records into state', () {
    cubit.loadMemories();
    expect(cubit.state.status, CoralMemoryStatus.success);
    expect(cubit.state.memories, isEmpty);
  });

  test('saveMemory, updateMemory, and deleteMemory lifecycle in Cubit', () {
    final fragment = CoralMemoryFragment(
      title: 'Current of the North',
      species: 'Vortex Frond',
      category: 'OCEAN_CURRENTS',
      discoveredAt: DateTime(2026, 2, 1),
      location: 'Northern Aqualis Shelf',
      description: 'Records of rapid glacial water downwelling.',
    );

    // Save
    cubit.saveMemory(fragment);
    expect(cubit.state.status, CoralMemoryStatus.success);
    expect(cubit.state.memories.length, 1);
    final saved = cubit.state.memories.first;
    expect(saved.title, 'Current of the North');

    // Update
    saved.title = 'Updated Current of the North';
    cubit.updateMemory(saved);
    expect(cubit.state.memories.first.title, 'Updated Current of the North');

    // Delete
    cubit.deleteMemory(saved.id);
    expect(cubit.state.memories, isEmpty);
  });

  test('searchMemories and filters update cubit state', () {
    cubit.seedSampleData();
    expect(cubit.state.memories.length, 5);

    // Search query
    cubit.searchMemories(query: 'Bioluminescent');
    expect(cubit.state.memories.length, 1);
    expect(cubit.state.memories.first.title, 'Bioluminescent Crown Coral');

    // Category filter
    cubit.setCategoryFilter('OCEAN_CURRENTS');
    expect(cubit.state.memories.length, 0); // No Bioluminescent in OCEAN_CURRENTS

    cubit.searchMemories(query: '');
    expect(cubit.state.memories.length, 1);
    expect(cubit.state.memories.first.category, 'OCEAN_CURRENTS');

    // Clear filters
    cubit.clearFilters();
    expect(cubit.state.memories.length, 5);
  });

  test('runStressTestBenchmark inserts 1,000 items and reports benchmark stats',
      () {
    cubit.runStressTestBenchmark(count: 1000);
    expect(cubit.state.memories.length, 1000);
    expect(cubit.state.benchmarkInfo,
        contains('⚡ ObjectBox Benchmark: Inserted 1000 records'));

    cubit.clearAllMemories();
    expect(cubit.state.memories, isEmpty);
  });
}
