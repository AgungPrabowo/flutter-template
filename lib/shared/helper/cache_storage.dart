import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static Future<String> getCache(String key) async {
    final SharedPreferences prefs = await _instance;
    return prefs.getString(key) ?? "";
  }

  static Future<bool> getCacheBool(String key) async {
    final SharedPreferences prefs = await _instance;
    return prefs.getBool(key) ?? false;
  }

  static Future<bool> setCacheBool(String key, bool data) async {
    final SharedPreferences prefs = await _instance;
    return prefs.setBool(key, data);
  }

  static Future<bool> setCache(String key, String data) async {
    final SharedPreferences prefs = await _instance;
    return prefs.setString(key, data);
  }

  static Future<List<String>> getCacheList(String key) async {
    final SharedPreferences prefs = await _instance;
    return prefs.getStringList(key) ?? [];
  }

  static Future<bool> setCacheList(String key, List<String> data) async {
    final SharedPreferences prefs = await _instance;
    return prefs.setStringList(key, data);
  }

  static Future<bool> removeCache(String key) async {
    final SharedPreferences prefs = await _instance;
    return prefs.remove(key);
  }

  static Future<bool> clearCache() async {
    final SharedPreferences prefs = await _instance;
    return prefs.clear();
  }
}
