import 'package:flutter/material.dart';
import 'package:flutter_book/misc/utils/app_initializer.dart';
import 'package:path_provider/path_provider.dart';

import 'flutter_book_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final docDir = await getApplicationDocumentsDirectory();
  appInit(docDir);
  runApp(const FlutterBookApp());
}
