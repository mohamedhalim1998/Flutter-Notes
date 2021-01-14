import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/model/Note.dart';
import 'package:notes_app/model/note_provider.dart';
import 'package:provider/provider.dart';

class AddNote extends StatelessWidget {
  static const String ROUTE_ID = "add-note-screen";
  String title;
  String note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<NoteProvider>(
              builder: (context, provider, child) {
                return ButtonTheme(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minWidth: 0,
                  height: 0,
                  padding:
                      const EdgeInsets.only(left: 10,bottom: 40),
                  child: FlatButton(
                    onPressed: () {
                      provider.insertNote(Note(title: title, note: note));
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black45,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextField(
                onChanged: (val) {
                  title = val;
                },
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.black38)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Expanded(
                child: TextField(
                  onChanged: (val) {
                    note = val;
                  },
                  autofocus: true,
                  style: TextStyle(fontSize: 18),
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Note",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
