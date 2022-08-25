import 'package:sqflite/sqflite.dart';
import '../models/identify_task.dart';

class IdentifyDBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "imagedataseven";

  static Future<void> initDb() async {
    if(_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'imagedataseven.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "name STRING, relation STRING, photo STRING, path STRING)",
          );
        },
      );
    }
    catch(e) {
      print(e);
    }
  }

  static Future<int> insert(IdentifyTask? task) async {
    print("insert function called");
    return await _db?.insert(_tableName, task!.toJson())??1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(IdentifyTask task) async{
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }
}