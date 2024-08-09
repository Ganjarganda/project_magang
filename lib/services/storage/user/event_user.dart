import '../event_storage/event_storage.dart';

class EventUser {
  /// --- user id
  saveUserId(int value) {
    EventStorage.box.write('key_user_id', value);
  }

  static getUserId() {
    int? value = EventStorage.box.read('key_user_id');
    return value ?? 0;
  }

}