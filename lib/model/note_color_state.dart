import 'package:flutter/material.dart';
import 'package:notes_app/utils/const.dart';

class NoteColor with ChangeNotifier {
  Color color = Color(kColorWhite);

  NoteColor() {
    color = Color(kColorWhite);
  }

  void changeColor(Color color) {
    this.color = color;
    notifyListeners();
  }
}
