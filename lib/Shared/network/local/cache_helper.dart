import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> setPrefs(key, value) async {
    return await prefs?.setBool(key, value);
  }

  Future<bool?> getPrefs(key) async {
    return prefs?.getBool(key);
  }

  Future<String?> setToken(key, value) async {
    await prefs?.setString(key, value);
    return null;
  }

  Future<String?> getToken(key) async {
    prefs?.getString(key);
    return null;
  }
}
