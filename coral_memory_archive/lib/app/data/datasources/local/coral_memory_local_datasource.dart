import 'package:coral_memory_archive/app/common/constants/app_string.dart';
import 'package:coral_memory_archive/app/data/datasources/local/objectbox_database.dart';
import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/objectbox.g.dart';

class CoralMemoryLocalDataSource {
  final ObjectBoxDatabase database;

  CoralMemoryLocalDataSource({
    required this.database,
  });

  Box<CoralMemoryFragment> get _box =>
      database.store.box<CoralMemoryFragment>();

  List<CoralMemoryFragment> getAll() {
    final query = _box.query()
      ..order(CoralMemoryFragment_.discoveredAt, flags: Order.descending);
    final built = query.build();
    try {
      return built.find();
    } finally {
      built.close();
    }
  }

  CoralMemoryFragment? getById(int id) {
    return _box.get(id);
  }

  int insert(CoralMemoryFragment memory) {
    return _box.put(memory);
  }

  int update(CoralMemoryFragment memory) {
    return _box.put(memory);
  }

  List<int> insertMany(List<CoralMemoryFragment> memories) {
    return _box.putMany(memories);
  }

  bool delete(int id) {
    return _box.remove(id);
  }

  int deleteAll() {
    return _box.removeAll();
  }

  int count() {
    return _box.count();
  }

  List<CoralMemoryFragment> search({
    String? query,
    DateTime? date,
    String? category,
  }) {
    final trimmedQuery = query?.trim() ?? '';
    final hasQuery = trimmedQuery.isNotEmpty;
    final hasCategory = category != null &&
        category.isNotEmpty &&
        category != AppStrings.allCategory;
    final hasDate = date != null;

    Condition<CoralMemoryFragment>? condition;

    if (hasQuery) {
      final queryCondition = CoralMemoryFragment_.title
          .contains(trimmedQuery, caseSensitive: false)
          .or(CoralMemoryFragment_.species
              .contains(trimmedQuery, caseSensitive: false))
          .or(CoralMemoryFragment_.description
              .contains(trimmedQuery, caseSensitive: false))
          .or(CoralMemoryFragment_.location
              .contains(trimmedQuery, caseSensitive: false));
      condition = queryCondition;
    }

    if (hasCategory) {
      final categoryCondition =
          CoralMemoryFragment_.category.equals(category);
      condition = condition == null
          ? categoryCondition
          : condition.and(categoryCondition);
    }

    if (hasDate) {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay =
          DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
      final dateCondition =
          CoralMemoryFragment_.discoveredAt.betweenDate(startOfDay, endOfDay);
      condition =
          condition == null ? dateCondition : condition.and(dateCondition);
    }

    final queryBuilder = condition == null
        ? _box.query()
        : _box.query(condition);

    queryBuilder.order(CoralMemoryFragment_.discoveredAt,
        flags: Order.descending);

    final built = queryBuilder.build();
    try {
      return built.find();
    } finally {
      built.close();
    }
  }
}
