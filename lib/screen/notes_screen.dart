import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/model/db_helper.dart';
import 'package:notes_app/model/Note.dart';
import 'package:notes_app/widgets/note_card.dart';
import 'package:notes_app/widgets/notes_list.dart';
import 'package:notes_app/widgets/search_box.dart';
import 'package:provider/provider.dart';

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
                child: Consumer<DatabaseHelper>(
                  builder: (context, value, child) {
                    return FutureBuilder(
                      future: getNotes(value),
                      builder: (context, snapshot) {
                        if (snapshot.hasData)
                          return NotesList(snapshot.data);
                        else
                          return Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Note>> getNotes(DatabaseHelper db) async {
    return await db.getAll();
  }
}
