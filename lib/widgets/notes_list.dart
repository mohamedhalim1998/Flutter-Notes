import 'package:flutter/material.dart';
import 'package:notes_app/model/Note.dart';
import 'package:notes_app/widgets/note_card.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;

  NotesList(this.notes);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3),
      itemBuilder: (context, index) {
        final Note note = notes.elementAt(index);
        return NoteCard(note);
      },
      itemCount: notes.length,
    );
  }
}
