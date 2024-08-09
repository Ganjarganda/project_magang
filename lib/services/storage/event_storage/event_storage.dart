import 'package:get_storage/get_storage.dart';

class EventStorage {
  static const names_box = 'magang_storage';
  static final GetStorage box = GetStorage(names_box);

  /// --- all
  static removeStorage() {
    box.erase();
  }
}
