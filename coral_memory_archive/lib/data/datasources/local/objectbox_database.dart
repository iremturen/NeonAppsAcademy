import 'package:coral_memory_archive/objectbox.g.dart';

class ObjectBoxDatabase {
  late final Store store;

  ObjectBoxDatabase._create(this.store);

  static Future<ObjectBoxDatabase> create() async {
    final store = await openStore();
    return ObjectBoxDatabase._create(store);
  }

  void close() {
    store.close();
  }
}