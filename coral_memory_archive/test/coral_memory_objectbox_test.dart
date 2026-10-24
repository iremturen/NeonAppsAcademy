import 'dart:io';
import 'package:coral_memory_archive/app/data/datasources/local/coral_memory_local_datasource.dart';
import 'package:coral_memory_archive/app/data/datasources/local/objectbox_database.dart';
import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/app/data/repositories/coral_memory_repository_impl.dart';
import 'package:coral_memory_archive/objectbox.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory tempDir;
  late Store store;
  late CoralMemoryLocalDataSource dataSource;
  late CoralMemoryRepositoryImpl repository;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('aqualis_objectbox_test_');
    store = Store(getObjectBoxModel(), directory: tempDir.path);
    final database = ObjectBoxDatabase(store);
    dataSource = CoralMemoryLocalDataSource(database: database);
    repository = CoralMemoryRepositoryImpl(localDataSource: dataSource);
  });

  tearDown(() {
    store.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('ObjectBox CRUD Operations', () {
    test('Add coral fragment and verify attributes stored', () {
      final fragment = CoralMemoryFragment(
        title: 'Sunken Pearl Fragment',
        species: 'Pinctada Radiata',
        category: 'MARINE_LIFE',
        imageUrl: 'images/pearl.png',
        discoveredAt: DateTime(2026, 4, 15, 10, 30),
        location: 'Aqualis Eastern Trench',
        description: 'Enchanted fragment pulsating with faint pearl light.',
      );

      final id = repository.save(fragment);
      expect(id, isPositive);

      final fetched = repository.getById(id);
      expect(fetched, isNotNull);
      expect(fetched!.title, 'Sunken Pearl Fragment');
      expect(fetched.species, 'Pinctada Radiata');
      expect(fetched.category, 'MARINE_LIFE');
      expect(fetched.imageUrl, 'images/pearl.png');
      expect(fetched.location, 'Aqualis Eastern Trench');
      expect(fetched.description,
          'Enchanted fragment pulsating with faint pearl light.');
      expect(fetched.discoveredAt.year, 2026);
      expect(fetched.discoveredAt.month, 4);
      expect(fetched.discoveredAt.day, 15);
    });

    test('Update existing coral fragment', () {
      final fragment = CoralMemoryFragment(
        title: 'Draft Record',
        species: 'Unknown Specimen',
        category: 'OTHER',
        discoveredAt: DateTime(2026, 1, 1),
        location: 'Unknown Depth',
        description: 'Pending analysis by Scribes.',
      );

      final id = repository.save(fragment);
      expect(id, isPositive);

      final toUpdate = repository.getById(id)!;
      toUpdate.title = 'Ancient Myth of Ocean Gate';
      toUpdate.species = 'Mythic Current Coral';
      toUpdate.category = 'ANCIENT_MYTHS';
      toUpdate.description = 'Fully decoded historical legend.';

      final updatedId = repository.update(toUpdate);
      expect(updatedId, id);

      final reFetched = repository.getById(id)!;
      expect(reFetched.title, 'Ancient Myth of Ocean Gate');
      expect(reFetched.species, 'Mythic Current Coral');
      expect(reFetched.category, 'ANCIENT_MYTHS');
      expect(reFetched.description, 'Fully decoded historical legend.');
    });

    test('Delete coral fragment by ID', () {
      final fragment = CoralMemoryFragment(
        title: 'Temporary Coral Node',
        species: 'Corallium Fragilis',
        category: 'SOFT_CORAL',
        discoveredAt: DateTime.now(),
        location: 'Reef Border',
        description: 'To be archived temporarily.',
      );

      final id = repository.save(fragment);
      expect(repository.getById(id), isNotNull);

      final deleted = repository.delete(id);
      expect(deleted, isTrue);
      expect(repository.getById(id), isNull);
    });
  });

  group('Fast Search Function (Title, Date, Key Details)', () {
    setUp(() {
      repository.saveAll([
        CoralMemoryFragment(
          title: 'Heart of the Abyssal Siren',
          species: 'Corallium Sirena',
          category: 'ANCIENT_MYTHS',
          discoveredAt: DateTime(2026, 3, 10, 14, 0),
          location: 'Trench of Whispers',
          description: 'Crystalline resonance humming ancient songs.',
        ),
        CoralMemoryFragment(
          title: 'Bioluminescent Crown',
          species: 'Noctiluca Grandis',
          category: 'MARINE_LIFE',
          discoveredAt: DateTime(2026, 5, 20, 9, 30),
          location: 'Northern Reef Canopy',
          description: 'Azure tentacles lighting dark ocean floors.',
        ),
        CoralMemoryFragment(
          title: 'Whirlpool Current Vector',
          species: 'Vortex Thermal Flow',
          category: 'OCEAN_CURRENTS',
          discoveredAt: DateTime(2026, 3, 10, 22, 15),
          location: 'Southern Thermal Vents',
          description: 'Swift warm-water stream powering Aqualis dome.',
        ),
        CoralMemoryFragment(
          title: 'Scribes Pillar of History',
          species: 'Chrysopelea Marina',
          category: 'HARD_CORAL',
          discoveredAt: DateTime(2025, 12, 1),
          location: 'Hall of Coral',
          description: 'Inscribed star charts and ancient marine codes.',
        ),
      ]);
    });

    test('Search by Title substring', () {
      final results = repository.search(query: 'Crown');
      expect(results.length, 1);
      expect(results.first.title, 'Bioluminescent Crown');
    });

    test('Search by Species substring', () {
      final results = repository.search(query: 'Sirena');
      expect(results.length, 1);
      expect(results.first.species, 'Corallium Sirena');
    });

    test('Search by Key Details (Description / Location)', () {
      final resultsDesc = repository.search(query: 'warm-water');
      expect(resultsDesc.length, 1);
      expect(resultsDesc.first.category, 'OCEAN_CURRENTS');

      final resultsLoc = repository.search(query: 'Whispers');
      expect(resultsLoc.length, 1);
      expect(resultsLoc.first.title, 'Heart of the Abyssal Siren');
    });

    test('Search by Specific Date', () {
      // Both Siren and Whirlpool were discovered on 2026-03-10
      final results = repository.search(date: DateTime(2026, 3, 10));
      expect(results.length, 2);
      expect(
        results.map((r) => r.title),
        containsAll([
          'Heart of the Abyssal Siren',
          'Whirlpool Current Vector',
        ]),
      );
    });

    test('Search by Category filter', () {
      final results = repository.search(category: 'ANCIENT_MYTHS');
      expect(results.length, 1);
      expect(results.first.title, 'Heart of the Abyssal Siren');
    });

    test('Combined Search: Date + Category + Query', () {
      final results = repository.search(
        query: 'Whirlpool',
        category: 'OCEAN_CURRENTS',
        date: DateTime(2026, 3, 10),
      );
      expect(results.length, 1);
      expect(results.first.title, 'Whirlpool Current Vector');
    });
  });

  group('High-Volume Performance & Stress Test (Thousands of Records)', () {
    test(
        'Integrate ObjectBox to manage 2,500 fragments with smooth performance',
        () {
      const recordCount = 2500;
      final fragments = List.generate(recordCount, (i) {
        final category = i % 2 == 0 ? 'MARINE_LIFE' : 'ANCIENT_MYTHS';
        final isTarget = i % 100 == 0;
        return CoralMemoryFragment(
          title: isTarget
              ? 'Aqualis Keystone Memory #$i'
              : 'Coral Fragment #$i',
          species: 'Species $i',
          category: category,
          discoveredAt: DateTime(2025, 1, 1).add(Duration(hours: i)),
          location: 'Deep Zone $i',
          description: isTarget
              ? 'Rare mythic key stored in Aqualis archive'
              : 'Standard marine record $i',
        );
      });

      // 1. Bulk insertion benchmark
      final insertStopwatch = Stopwatch()..start();
      final ids = repository.saveAll(fragments);
      insertStopwatch.stop();

      expect(ids.length, recordCount);
      expect(repository.count(), recordCount);
      // Inserting 2,500 items via ObjectBox putMany takes well under 1000ms
      expect(insertStopwatch.elapsedMilliseconds, lessThan(3000));

      // 2. Fast query search over 2,500 indexed items
      final searchStopwatch = Stopwatch()..start();
      final searchResults = repository.search(query: 'Aqualis Keystone');
      searchStopwatch.stop();

      expect(searchResults.length, 25);
      // Indexed ObjectBox query over thousands of items must return within 200ms
      expect(searchStopwatch.elapsedMilliseconds, lessThan(200));

      // 3. Date range search over 2,500 items
      final dateSearchStopwatch = Stopwatch()..start();
      final dateResults = repository.search(date: DateTime(2025, 1, 1));
      dateSearchStopwatch.stop();

      expect(dateResults.isNotEmpty, isTrue);
      expect(dateSearchStopwatch.elapsedMilliseconds, lessThan(200));

      // 4. Smooth deletion of bulk data
      final deletedCount = repository.deleteAll();
      expect(deletedCount, recordCount);
      expect(repository.count(), 0);
    });
  });
}
