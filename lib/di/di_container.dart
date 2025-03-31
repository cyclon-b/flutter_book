import 'package:flutter_book/services/db_service.dart';
import 'package:get_it/get_it.dart';

class DiContainer {
  static final getIt = GetIt.instance;

  static void initProviders() {
    getIt.registerSingleton<DbService>(DbService());
  }
}
