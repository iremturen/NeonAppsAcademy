import 'package:coral_memory_archive/objectbox.g.dart';

class ObjectBoxDatabase {
  final Store store;

  ObjectBoxDatabase(this.store);

  static Future<ObjectBoxDatabase> create() async {
    final store = await openStore();
    return ObjectBoxDatabase(store);
  }

  void close() {
    store.close();
  }
}
