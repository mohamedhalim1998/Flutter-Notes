import 'package:flutter/material.dart';
import 'package:notes_app/model/db_helper.dart';
import 'package:notes_app/model/note_provider.dart';
import 'package:notes_app/screen/add_note_screen.dart';
import 'package:notes_app/screen/notes_screen.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        initialRoute: Notes.ROUTE_ID,
        routes: {
          Notes.ROUTE_ID:(context) => Notes(),
          AddNote.ROUTE_ID:(context) => AddNote(),

        },
      ),
    );
  }
}
