import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';

abstract class CoralMemoryRepository {
  List<CoralMemoryFragment> getAll();

  CoralMemoryFragment? getById(int id);

  int save(CoralMemoryFragment memory);

  bool delete(int id);
}