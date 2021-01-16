import 'package:flutter/material.dart';
import 'package:notes_app/model/note_color_state.dart';
import 'package:provider/provider.dart';

import 'color_list_view.dart';
class NotePopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteColor>(
      builder: (context, value, child) {
        return Container(
          color: value.color,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.delete_outline_outlined),
                title: Text("Delete"),
              ),
              ListTile(
                leading: Icon(Icons.copy_rounded),
                title: Text("Copy"),
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text("Share"),
              ),
              ColorsListView(),
            ],
          ),
        );
      },
    );
  }
}
