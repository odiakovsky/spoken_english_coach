import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static SharedPreferences? sharedPrefs;

  static bool getIsDarkmodeEnabled() =>
      sharedPrefs?.getBool('is_darkmode_enabled') ?? false;

  static setIsDarkmodeEnabled(bool value) {
    sharedPrefs?.setBool('is_darkmode_enabled', value);
  }

}
