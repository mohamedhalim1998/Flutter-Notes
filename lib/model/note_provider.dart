import 'package:flutter/foundation.dart';
import 'package:notes_app/model/db_helper.dart';
import 'package:uuid/uuid.dart';

import 'Note.dart';

class NoteProvider with ChangeNotifier {
  DatabaseHelper helper;

  NoteProvider() {
    init();
  }
  init() async{
    this.helper = DatabaseHelper();
    await helper.init();
    notifyListeners();
  }

  void insertNote(Note note) {
    note.id = Uuid().v4();
    helper.insert(note);
    notifyListeners();
  }

  Future<List<Note>> getAllNotes() async {
    final List<Map<String, dynamic>> maps = await helper.getAll();
    return List.generate(maps.length, (index) => Note.fromMap(maps[index]));
  }
}
