import 'package:flutter/material.dart';
class NoteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Title",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "this a text for note style to test the the style of the note" ,
              style: TextStyle(
                  color: Colors.black54
              ),
            ),
          ],
        ),
      ),
    );
  }
}