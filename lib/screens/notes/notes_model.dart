import '../../base_classes/base_app_model.dart';

class NoteModel {
  late String id;
  late String title;
  late String content;
  late String color;


  @override
  String toString() {
    return "{id = $id, title = $title, content = $content, color = $color} ";
  }
}

class NotesModel extends BaseAppModel {
  late String color;

  void setColor(dynamic newColor) {
    color = newColor;
    notifyListeners();
  }
}

final notesModel = NotesModel();
