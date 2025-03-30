import 'package:flutter_book/screens/notes/notes_model.dart';
import 'package:flutter_book/services/db_service.dart';
import 'package:get_it/get_it.dart';

class DiContainer {
  static final GetIt _getItInstance = GetIt.I;

  static void initProviders() {
    GetIt.I.registerLazySingleton(() => DbService());
  }

  static GetIt get getItInstance => _getItInstance;
}
