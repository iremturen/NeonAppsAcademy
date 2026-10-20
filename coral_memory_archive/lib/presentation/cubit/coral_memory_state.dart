import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/presentation/cubit/enum/coral_memory_status.dart';

class CoralMemoryState {
  final CoralMemoryStatus status;
  final List<CoralMemoryFragment> memories;
  final String? errorMessage;

  const CoralMemoryState({
    this.status = CoralMemoryStatus.initial,
    this.memories = const [],
    this.errorMessage,
  });
}