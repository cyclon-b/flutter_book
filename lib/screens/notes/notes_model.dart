import '../../store/base_classes/base_app_model.dart';

class NoteModel {
  late int id;
  late String title;
  late String content;
  late String color;

  String toString() {
    return "{id = $id, title = $title, content = $content, color = $color} ";
  }
}

class NotesModel extends BaseAppModel {
  late String color;

  void setColor(String newColor) {
    color = newColor;
    notifyListeners();
  }
}
