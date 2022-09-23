class NoteModel {
  int? id;
  String? title;
  String? date;
  String? note;

  NoteModel({this.id, this.title, this.date, this.note});

  NoteModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    date = data['date'];
    note = data['note'];
  }
}
