import 'package:hive/hive.dart';
import 'package:scoped_model/scoped_model.dart';

interface class BaseAppModel extends Model {
  int stackIndex = 0;
  List entityList = [];
  var entityBeingEdited;
  String chosenDate = '';

  void setChosenDate( String inDate) {
    chosenDate = inDate;
    notifyListeners();
  }

  void getData(String inEntityType, String dataBoxKey) {
    List<String> dataBoxKeys = Hive.box(name: dataBoxKey).keys;
    entityList = Hive.box(name: dataBoxKey).getAll(dataBoxKeys);
    notifyListeners();
  }

  void setStackIndex(int inStackIndex) {
    stackIndex = inStackIndex;
    notifyListeners();
  }


}