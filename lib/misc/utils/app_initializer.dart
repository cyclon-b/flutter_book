import 'dart:io';

import 'package:flutter_book/misc/constants/hive_boxes_keys.dart';
import 'package:flutter_book/misc/constants/hive_boxes_name.dart';
import 'package:hive/hive.dart';

import '../../di/di_container.dart';
import '../../services/db_service.dart';

appInit(Directory docDir) {
  DiContainer.initProviders();
  final DbService db = DiContainer.getIt.get<DbService>();
  final String path = docDir.path;
  Hive.defaultDirectory = path;
  var configBox = Hive.box(name: HiveBoxName.configBoxName);
  configBox.put(HiveBoxesKeys.docDirPath, path);
  db.initDatabases();
}
