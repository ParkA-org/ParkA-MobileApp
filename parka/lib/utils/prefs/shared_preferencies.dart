import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenciesUtil {
  static SharedPreferences _sharedPreferencies;

  void _init() async {
    print("INIT SHARED PREFS");
    _sharedPreferencies = await SharedPreferences.getInstance();
  }

  static SharedPreferences get storage => _sharedPreferencies;

  SharedPreferenciesUtil() {
    this._init();
  }
}
