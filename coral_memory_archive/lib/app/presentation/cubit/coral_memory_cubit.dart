// ignore_for_file: prefer_initializing_formals

import 'package:coral_memory_archive/app/common/constants/app_string.dart';
import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/app/domain/usecases/coral_memory_usecases.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_state.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoralMemoryCubit extends Cubit<CoralMemoryState> {
  final GetAllMemories _getAllMemories;
  final SaveMemory _saveMemory;
  final DeleteMemory _deleteMemory;
  final UpdateMemory? _updateMemory;
  final SearchMemories? _searchMemories;
  final SaveAllMemories? _saveAllMemories;
  final ClearAllMemories? _clearAllMemories;

  CoralMemoryCubit({
    required GetAllMemories getAllMemories,
    required SaveMemory saveMemory,
    required DeleteMemory deleteMemory,
    UpdateMemory? updateMemory,
    SearchMemories? searchMemories,
    SaveAllMemories? saveAllMemories,
    ClearAllMemories? clearAllMemories,
  })  : _getAllMemories = getAllMemories,
        _saveMemory = saveMemory,
        _deleteMemory = deleteMemory,
        _updateMemory = updateMemory,
        _searchMemories = searchMemories,
        _saveAllMemories = saveAllMemories,
        _clearAllMemories = clearAllMemories,
        super(const CoralMemoryState());

  void loadMemories() {
    emit(state.copyWith(status: CoralMemoryStatus.loading));

    try {
      final memories = _searchOrGetAll();
      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void saveMemory(CoralMemoryFragment memory) {
    emit(state.copyWith(status: CoralMemoryStatus.loading));

    try {
      if (memory.id > 0 && _updateMemory != null) {
        _updateMemory(memory);
      } else {
        _saveMemory(memory);
      }

      final memories = _searchOrGetAll();
      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void updateMemory(CoralMemoryFragment memory) {
    saveMemory(memory);
  }

  void deleteMemory(int id) {
    emit(state.copyWith(status: CoralMemoryStatus.loading));

    try {
      _deleteMemory(id);
      final memories = _searchOrGetAll();

      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void searchMemories({
    String? query,
    DateTime? date,
    String? category,
  }) {
    final nextQuery = query ?? state.searchQuery;
    final nextDate = date ?? state.selectedDate;
    final nextCategory = category ?? state.selectedCategory;

    emit(
      state.copyWith(
        status: CoralMemoryStatus.loading,
        searchQuery: nextQuery,
        selectedDate: nextDate,
        selectedCategory: nextCategory,
      ),
    );

    try {
      final memories = _executeSearch(
        query: nextQuery,
        date: nextDate,
        category: nextCategory,
      );

      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
          searchQuery: nextQuery,
          selectedDate: nextDate,
          selectedCategory: nextCategory,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void setDateFilter(DateTime? date) {
    emit(
      state.copyWith(
        status: CoralMemoryStatus.loading,
        selectedDate: date,
        clearDate: date == null,
      ),
    );

    try {
      final memories = _executeSearch(
        query: state.searchQuery,
        date: date,
        category: state.selectedCategory,
      );

      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
          selectedDate: date,
          clearDate: date == null,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void setCategoryFilter(String? category) {
    final clear = category == null || category == AppStrings.allCategory;
    emit(
      state.copyWith(
        status: CoralMemoryStatus.loading,
        selectedCategory: clear ? null : category,
        clearCategory: clear,
      ),
    );

    try {
      final memories = _executeSearch(
        query: state.searchQuery,
        date: state.selectedDate,
        category: clear ? null : category,
      );

      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
          selectedCategory: clear ? null : category,
          clearCategory: clear,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void clearFilters() {
    emit(
      state.copyWith(
        status: CoralMemoryStatus.loading,
        searchQuery: '',
        clearDate: true,
        clearCategory: true,
      ),
    );

    try {
      final memories = _getAllMemories();
      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
          searchQuery: '',
          clearDate: true,
          clearCategory: true,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void seedSampleData() {
    emit(state.copyWith(status: CoralMemoryStatus.loading));

    try {
      final sampleMemories = _generateSampleMemories();
      if (_saveAllMemories != null) {
        _saveAllMemories(sampleMemories);
      } else {
        for (final memory in sampleMemories) {
          _saveMemory(memory);
        }
      }

      final memories = _searchOrGetAll();
      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
          benchmarkInfo:
              'Populated ${sampleMemories.length} enchanted coral fragments of Aqualis lore.',
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void runStressTestBenchmark({int count = 1000}) {
    emit(state.copyWith(status: CoralMemoryStatus.loading));

    try {
      final stopwatch = Stopwatch()..start();
      final batch = _generateStressTestBatch(count);

      // Measure bulk insertion time
      if (_saveAllMemories != null) {
        _saveAllMemories(batch);
      } else {
        for (final m in batch) {
          _saveMemory(m);
        }
      }
      stopwatch.stop();
      final insertMs = stopwatch.elapsedMilliseconds;

      // Measure query search time on indexed fields
      final queryStopwatch = Stopwatch()..start();
      final searchResults = _executeSearch(
        query: 'Aqualis',
      );
      queryStopwatch.stop();
      final queryMs = queryStopwatch.elapsedMicroseconds / 1000.0;

      final memories = _searchOrGetAll();
      final info =
          '⚡ ObjectBox Benchmark: Inserted $count records in ${insertMs}ms. Queried ${searchResults.length} matches in ${queryMs.toStringAsFixed(2)}ms.';

      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: memories,
          benchmarkInfo: info,
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  void clearAllMemories() {
    emit(state.copyWith(status: CoralMemoryStatus.loading));

    try {
      if (_clearAllMemories != null) {
        _clearAllMemories();
      }
      emit(
        state.copyWith(
          status: CoralMemoryStatus.success,
          memories: [],
          benchmarkInfo: 'Cleared all coral fragments.',
        ),
      );
    } catch (error) {
      _emitError(error);
    }
  }

  List<CoralMemoryFragment> _searchOrGetAll() {
    if (state.searchQuery.isNotEmpty ||
        state.selectedDate != null ||
        (state.selectedCategory != null &&
            state.selectedCategory != AppStrings.allCategory)) {
      return _executeSearch(
        query: state.searchQuery,
        date: state.selectedDate,
        category: state.selectedCategory,
      );
    }
    return _getAllMemories();
  }

  List<CoralMemoryFragment> _executeSearch({
    String? query,
    DateTime? date,
    String? category,
  }) {
    if (_searchMemories != null) {
      return _searchMemories(
        query: query,
        date: date,
        category: category,
      );
    }

    // Fallback if search use case not injected
    var list = _getAllMemories();
    if (query != null && query.isNotEmpty) {
      final q = query.toLowerCase();
      list = list.where((m) {
        return m.title.toLowerCase().contains(q) ||
            m.species.toLowerCase().contains(q) ||
            m.description.toLowerCase().contains(q) ||
            m.location.toLowerCase().contains(q);
      }).toList();
    }
    if (category != null &&
        category.isNotEmpty &&
        category != AppStrings.allCategory) {
      list = list.where((m) => m.category == category).toList();
    }
    if (date != null) {
      list = list.where((m) =>
          m.discoveredAt.year == date.year &&
          m.discoveredAt.month == date.month &&
          m.discoveredAt.day == date.day).toList();
    }
    return list;
  }

  void _emitError(Object error) {
    emit(
      state.copyWith(
        status: CoralMemoryStatus.error,
        errorMessage: error.toString(),
      ),
    );
  }

  List<CoralMemoryFragment> _generateSampleMemories() {
    return [
      CoralMemoryFragment(
        title: 'Heart of the Abyssal Siren',
        species: 'Corallium Sirena',
        category: 'ANCIENT_MYTHS',
        discoveredAt: DateTime.now().subtract(const Duration(days: 120)),
        location: 'Trench of Whispers, Aqualis',
        description:
            'A crystalline coral formation vibrating with voices of ancient ocean spirits during the celestial tides.',
      ),
      CoralMemoryFragment(
        title: 'Bioluminescent Crown Coral',
        species: 'Noctiluca Grandis',
        category: 'MARINE_LIFE',
        discoveredAt: DateTime.now().subtract(const Duration(days: 45)),
        location: 'Northern Reef Canopy',
        description:
            'Deep blue tentacles glowing with azure luminescence, guiding underwater navigators across the seabed.',
      ),
      CoralMemoryFragment(
        title: 'Whirlpool of the Southern Abyss',
        species: 'Vortex Thermal Flow',
        category: 'OCEAN_CURRENTS',
        discoveredAt: DateTime.now().subtract(const Duration(days: 10)),
        location: 'Southern Thermal Vents',
        description:
            'A submerged high-velocity current mapping the warm water pathways that regulate Aqualis climate dome.',
      ),
      CoralMemoryFragment(
        title: 'Golden Pillar of Ocean Scribes',
        species: 'Chrysopelea Marina',
        category: 'HARD_CORAL',
        discoveredAt: DateTime.now().subtract(const Duration(days: 300)),
        location: 'Hall of Coral Archives',
        description:
            'Petrified coral pillar bearing maritime history and star alignments preserved since ancient Aqualis.',
      ),
      CoralMemoryFragment(
        title: 'Whispering Sea Fan',
        species: 'Gorgonia Silentium',
        category: 'SOFT_CORAL',
        discoveredAt: DateTime.now().subtract(const Duration(days: 2)),
        location: 'Sunken Cathedral Gardens',
        description:
            'Delicate violet fan coral sensitive to whale acoustics and deep undersea seismic ripples.',
      ),
    ];
  }

  List<CoralMemoryFragment> _generateStressTestBatch(int count) {
    final categories = [
      'MARINE_LIFE',
      'OCEAN_CURRENTS',
      'ANCIENT_MYTHS',
      'HARD_CORAL',
      'SOFT_CORAL',
      'CORAL_REEF',
      'MARINE_HABITAT',
    ];

    final locations = [
      'Hall of Coral',
      'Aqualis Sunken Spire',
      'Abyssal Trench',
      'Luminescent Barrier Reef',
      'Poseidon Trench',
      'Mermaid Shallows',
    ];

    final speciesList = [
      'Acropora Aqualis',
      'Pocillopora Cerulea',
      'Stylophora Mystica',
      'Favites Aeterna',
      'Tubastrea Lucida',
    ];

    final now = DateTime.now();

    return List.generate(count, (index) {
      final category = categories[index % categories.length];
      final location = locations[index % locations.length];
      final species = speciesList[index % speciesList.length];
      final date = now.subtract(Duration(days: index % 365, hours: index % 24));

      return CoralMemoryFragment(
        title: 'Coral Memory #$index - Aqualis Fragment',
        species: species,
        category: category,
        discoveredAt: date,
        location: location,
        description:
            'Archival record #$index cataloged by the Ocean Scribes of Aqualis. Encoded details of marine life and ocean currents.',
      );
    });
  }
}
