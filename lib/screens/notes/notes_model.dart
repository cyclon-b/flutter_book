import 'package:uuid/uuid.dart';

import '../../base_classes/base_app_model.dart';

var uuid = Uuid();

class NoteModel {
  late String id = uuid.v4();
  late String title;
  late String content;
  late dynamic color;

  @override
  String toString() {
    return "{id = $id, title = $title, content = $content, color = $color} ";
  }
}

class NotesModel extends BaseAppModel {
  dynamic color;

  void setColor(dynamic newColor) {
    color = newColor;
    notifyListeners();
  }
}

final notesModel = NotesModel();
