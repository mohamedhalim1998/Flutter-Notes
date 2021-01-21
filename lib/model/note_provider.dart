import 'package:flutter/foundation.dart';
import 'package:notes_app/model/db_helper.dart';
import 'package:uuid/uuid.dart';

import 'Note.dart';

class NoteProvider with ChangeNotifier {
  DatabaseHelper helper = DatabaseHelper.instance;

  void insertNote(Note note) {
    if (isNotEmptyNote(note)) {
      note.id = Uuid().v4();
      note.time = DateTime.now().millisecond;
      helper.insert(note);
      notifyListeners();
    }
  }

  void updateNote(Note note) async {
    if (isNotEmptyNote(note)) {
      if (await hasChanged(note)) {
        note.time = DateTime.now().millisecond;
        helper.update(note);
        notifyListeners();
      }
    }
  }

  Future<bool> hasChanged(Note note) async {
    Note old = Note.fromMap(await helper.getNote(note.id));
    return old != note;
  }

  Future<List<Note>> getAllNotes() async {
    final List<Map<String, dynamic>> maps = await helper.getAll();
    return List.generate(maps.length, (index) => Note.fromMap(maps[index]));
  }

  bool isNotEmptyNote(Note note) {
    return ((note.title != null && note.title.isNotEmpty) ||
        (note.note != null && note.note.isNotEmpty));
  }
}
