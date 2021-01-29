import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static Future<String> getCache({@required String key}) async {
    final SharedPreferences prefs = await _instance;
    return prefs?.getString(key) ?? "";
  }

  static Future<bool> getCacheBool({@required String key}) async {
    final SharedPreferences prefs = await _instance;
    return prefs?.getBool(key) ?? false;
  }

  static Future<bool> setCacheBool(
      {@required String key, @required bool data}) async {
    final SharedPreferences prefs = await _instance;
    return prefs?.setBool(key, data) ?? Future.value(false);
  }

  static Future<bool> setCache(
      {@required String key, @required String data}) async {
    final SharedPreferences prefs = await _instance;
    return prefs?.setString(key, data) ?? Future.value(false);
  }

  static Future<List<String>> getCacheList({@required String key}) async {
    final SharedPreferences prefs = await _instance;
    return prefs?.getStringList(key) ?? [];
  }

  static Future<bool> setCacheList(
      {@required String key, @required List<String> data}) async {
    final SharedPreferences prefs = await _instance;
    return prefs?.setStringList(key, data) ?? Future.value(false);
  }

  static Future<bool> removeCache({@required String key}) async {
    final SharedPreferences prefs = await _instance;
    return prefs?.remove(key) ?? Future.value(false);
  }

  static Future<bool> clearCache() async {
    final SharedPreferences prefs = await _instance;
    return prefs?.clear() ?? Future.value(false);
  }
}