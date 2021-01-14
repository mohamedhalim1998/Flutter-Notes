class Note {
  String id;
  String title;
  String note;

  Note({this.title, this.note});

  Note.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.title = map["title"];
    this.note = map["note"];
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "note": note};
  }
}
