import 'package:hive/hive.dart';

class DbService {
  void createBox(String key) {
    Hive.box(name: key);
  }

  void create(String boxName, String fieldKey, dynamic value) {
    var box = Hive.box(name: boxName);
    box.put(fieldKey, value);
  }

  dynamic read(String boxName, String fieldKey) {

  }

  void update(String boxName, String fieldKey, dynamic newValue) {
    var box = Hive.box(name: boxName);
    box.put(fieldKey, newValue);
  }

  void delete(String key) {}
}
