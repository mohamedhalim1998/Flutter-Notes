import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/note_card.dart';
import 'package:notes_app/widgets/search_box.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBox(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                    NoteCard(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
