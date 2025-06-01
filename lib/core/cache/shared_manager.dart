// ignore_for_file: avoid_positional_boolean_parameters

import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedManager._initialize();
  static final SharedManager _instance = SharedManager._initialize();
  static SharedManager get instance => _instance;
  late final SharedPreferences _prefs;

  Future<SharedManager> init() async {
    _prefs = await SharedPreferences.getInstance(); 
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return _prefs.setStringList(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key) ;
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }
}
