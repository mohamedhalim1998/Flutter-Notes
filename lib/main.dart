import 'package:flutter/material.dart';
import 'package:notes_app/screen/notes_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Notes(),
    );
  }
}
