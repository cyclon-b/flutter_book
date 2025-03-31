import 'package:flutter_book/di/di_container.dart';
import 'package:flutter_book/services/db_service.dart';
import 'package:scoped_model/scoped_model.dart';

class BaseAppModel extends Model {
  int stackIndex = 0;
  List<dynamic> entityList = [];
  var entityBeingEdited;
  String chosenDate = '';
  final DbService _db = DiContainer.getIt.get<DbService>();

  void setChosenDate(String inDate) {
    chosenDate = inDate;
    notifyListeners();
  }

  void getData(String boxName, String fieldName) {
    entityList = _db.read(boxName) ?? [];
    notifyListeners();
  }

  void setStackIndex(int inStackIndex) {
    stackIndex = inStackIndex;
    notifyListeners();
  }
}
