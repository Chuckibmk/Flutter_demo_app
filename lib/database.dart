import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  String databaseName = "users.db";
  String tableName = "users";
  int DBVersion = 1;
  DatabaseHelper() {
    initializedDB();
  }
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, databaseName), version: DBVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT NOT NULL,grade TEXT NOT NULL)");
    });
  }

  Future<int> insert(Map<String, dynamic> row) async {
    int result = 0;
    final Database db = await initializedDB();
    result = await db.insert("users", row);
    return result;
  }

  Future<List<Map<String, dynamic>>> selectUser() async {
    final Database db = await initializedDB();
    var res = await db.rawQuery("SELECT * FROM " + tableName);
    if (res.isNotEmpty) {
      return res;
    } else {
      return [];
    }
  }

  Future<int> update(Map<String, dynamic> row, id) async {
    final Database db = await initializedDB();

    return await db.update("users", row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final Database db = await initializedDB();

    return await db.delete("users", where: 'id = ?', whereArgs: [id]);
  }
}
