import 'dart:convert';

import '../../store/base_classes/base_app_model.dart';
import '../../store/base_classes/base_entity_model.dart';

class NoteModel implements BaseEntityModel {
  late String id;
  late String title;
  late String content;
  late String color;

  NoteModel({
    required this.id,
    required this.title,
    required this.color,
    required this.content,
  });

  @override
  fromJson(String jsonString) {
    Map<String, dynamic> jsonInMap = jsonDecode(jsonString);
    return NoteModel(
        id: jsonInMap['id'],
        title: jsonInMap['title'],
        color: jsonInMap['color'],
        content: jsonInMap['content']);
  }

  @override
  String modelToJson() {
    Map<String, dynamic> resultMap = {
      id: id,
      title: title,
      content: content,
      color: color,
    };
    return jsonEncode(resultMap);
  }

  @override
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

final NotesModel notesModel = NotesModel();