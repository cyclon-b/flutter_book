import 'package:flutter_book/misc/constants/hive_boxes_name.dart';
import 'package:flutter_book/screens/notes/notes_model.dart';
import 'package:hive/hive.dart';

class DbService {
  void initDatabases() {
    createBox(HiveBoxName.appointments);
    createBox(HiveBoxName.notes);
    createBox(HiveBoxName.contacts);
    createBox(HiveBoxName.tasks);
  }

  void createBox(String key) {
    Hive.box(name: key);
  }

  void create(String boxName, dynamic value) {
    var box = Hive.box(name: boxName);
    box.add(value);
  }

  List<dynamic> read(String boxName) {
    var box = Hive.box(name: boxName);
    var keys = box.keys;
    return box.getAll(keys) ?? [];
  }

  dynamic readById(String boxName, String id) {
    var box = Hive.box(name: boxName);
    var keys = box.keys;
    return box.getAll(keys).where((el) => el.id == id);
  }

  void update(String boxName, String fieldKey, dynamic newValue) {
    var box = Hive.box(name: boxName);
    box.put(fieldKey, newValue);
  }

  void delete(String boxName, int index) {
    var box = Hive.box(name: boxName);
    box.deleteAt(index);
  }
}
