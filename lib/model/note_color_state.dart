import 'package:flutter/material.dart';
import 'package:notes_app/utils/const.dart';

class NoteColor with ChangeNotifier {
  Color color = Color(colors[0]);

  NoteColor() {
    color = Color(colors[0]);
  }

  void changeColor(Color color) {
    this.color = color;
    notifyListeners();
  }
}
