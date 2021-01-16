import 'package:flutter/foundation.dart';
import 'package:notes_app/model/Note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper with ChangeNotifier {
  Database database;
  String table = 'notes';

  init() async {
    database = await openDatabase(
      join(await getDatabasesPath(), "notes.db"),
      onCreate: (db, version) => createTable(db),
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute("DROP TABLE IF EXISTS $table;");
        createTable(db);
      },
      version: 3,
    );
  }
  void createTable(Database db){
    db.execute(
        "CREATE TABLE $table(id TEXT PRIMARY KEY,title TEXT,note  TEXT, color INTEGER, time INTEGER);");
  }

  Future<void> insert(Note note) async {
    await database.insert(table, note.toMap());
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return await database.query(table);
  }
}
