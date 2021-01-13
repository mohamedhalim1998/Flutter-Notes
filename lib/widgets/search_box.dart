import 'package:flutter/material.dart';
class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16.0),
                  hintText: "Search your notes",
                ),
              ),
            ),
            Icon(
              Icons.search,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
