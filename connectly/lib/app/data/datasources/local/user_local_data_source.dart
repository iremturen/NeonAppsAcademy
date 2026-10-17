import 'package:connectly/app/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserLocalDataSource {
  static const String _databaseName = 'connectly.db';
  static const String _tableName = 'users';
  static const int _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            surname TEXT NOT NULL,
            age INTEGER NOT NULL,
            email TEXT NOT NULL,
            address TEXT
          )
        ''');
      },
    );

    return _database!;
  }

  Future<int> insertUser(UserModel user) async {
    final db = await database;

    final userMap = user.toMap()..remove('id');

    return db.insert(
      _tableName,
      userMap,
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }
}