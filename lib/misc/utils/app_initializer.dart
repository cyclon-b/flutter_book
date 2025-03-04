import 'dart:io';

import 'package:flutter_book/misc/constants/hive_boxes_keys.dart';
import 'package:flutter_book/misc/constants/hive_boxes_name.dart';
import 'package:hive/hive.dart';

 appInit(Directory docDir) {
  final String path =  docDir.path;
  Hive.defaultDirectory = path;
  var configBox = Hive.box(name: HiveBoxName.configBoxName);
  configBox.put(HiveBoxesKeys.docDirPath, path);
}