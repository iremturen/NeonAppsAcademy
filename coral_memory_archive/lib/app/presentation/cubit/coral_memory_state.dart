import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_status.dart';

class CoralMemoryState {
  final CoralMemoryStatus status;
  final List<CoralMemoryFragment> memories;
  final String? errorMessage;
  final String searchQuery;
  final DateTime? selectedDate;
  final String? selectedCategory;
  final String? benchmarkInfo;

  const CoralMemoryState({
    this.status = CoralMemoryStatus.initial,
    this.memories = const [],
    this.errorMessage,
    this.searchQuery = '',
    this.selectedDate,
    this.selectedCategory,
    this.benchmarkInfo,
  });

  CoralMemoryState copyWith({
    CoralMemoryStatus? status,
    List<CoralMemoryFragment>? memories,
    String? errorMessage,
    String? searchQuery,
    DateTime? selectedDate,
    bool clearDate = false,
    String? selectedCategory,
    bool clearCategory = false,
    String? benchmarkInfo,
  }) {
    return CoralMemoryState(
      status: status ?? this.status,
      memories: memories ?? this.memories,
      errorMessage: errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedDate: clearDate ? null : (selectedDate ?? this.selectedDate),
      selectedCategory:
          clearCategory ? null : (selectedCategory ?? this.selectedCategory),
      benchmarkInfo: benchmarkInfo ?? this.benchmarkInfo,
    );
  }
}
