import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final docDir = await getApplicationDocumentsDirectory();
  final path =  docDir.path;
  print('Path: $path');
  Hive.defaultDirectory = path;

  var configBox = Hive.box(name: 'Config');
  configBox.put('doc_dir_path', path);
  final path2 = configBox.get('doc_dir_path');
  print('Docs: $path2');
  runApp(const MyApp());
}




