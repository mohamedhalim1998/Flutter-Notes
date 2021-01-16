import 'package:notes_app/model/Note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database _database;
  String _table = 'notes';
  int _version = 3;
  static final DatabaseHelper instance = DatabaseHelper._constructor();

  DatabaseHelper._constructor();
  Future<Database> get database async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), "notes.db"),
        onCreate: (db, version) => _createTable(db),
        onUpgrade: (db, oldVersion, newVersion) {
          db.execute("DROP TABLE IF EXISTS $_table;");
          _createTable(db);
        },
        version: _version,
      );
    }
    return _database;
  }
  init() async {

  }

  void _createTable(Database db) {
    db.execute(
        "CREATE TABLE $_table(id TEXT PRIMARY KEY,title TEXT,note  TEXT, color INTEGER, time INTEGER);");
  }

  Future<void> insert(Note note) async {
    Database db = await instance.database;
    await db.insert(_table, note.toMap());
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    Database db = await instance.database;
    return await db.query(_table);
  }
}
