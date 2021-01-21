import 'package:flutter/material.dart';
import 'package:notes_app/model/Note.dart';
import 'package:notes_app/model/note_color_state.dart';
import 'package:notes_app/model/note_provider.dart';
import 'package:notes_app/widgets/note_bottom_bar.dart';
import 'package:provider/provider.dart';

class AddNote extends StatelessWidget {
  static const String ROUTE_ID = "add-note-screen";
  String title;
  String note;

  @override
  Widget build(BuildContext context) {
    final NoteProvider provider = context.read<NoteProvider>();
    return Consumer<NoteColor>(
      builder: (context, color, child) {
        return WillPopScope(
          onWillPop: () async{
            provider.insertNote(Note(
                title: title,
                note: note,
                color: color.color.value));
            return true;
          },
          child: Scaffold(
            backgroundColor: color.color,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<NoteProvider>(
                    builder: (context, provider, child) {
                      return IconButton(
                          padding: EdgeInsets.only(left: 10, bottom: 40),
                          icon: Icon(Icons.arrow_back),
                          color: Colors.black45,
                          onPressed: () {
                            provider.insertNote(Note(
                                title: title,
                                note: note,
                                color: color.color.value));
                            Navigator.pop(context);
                          });
                    },
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: TextField(
                        expands: true,
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
                  ),
                  BottomBar(),
                ],
              ),
            )
            ,
          )
          ,
        );
      },
    );
  }
}
