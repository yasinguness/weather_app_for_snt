import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  static Future<dynamic> prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<bool> clear() async {
    return _preferences!.clear();
  }

  Future<bool> setDynamicJson<T>(PreferencesKeys key, T model) async {
    return _preferences!.setString(key.toString(), jsonEncode(model));
  }

  Future<bool> setStringValue(PreferencesKeys key, String value) async {
    return _preferences!.setString(key.toString(), value);
  }

  Future<bool> setIntegerValue(PreferencesKeys key, int value) async {
    return _preferences!.setInt(key.toString(), value);
  }

  Future<bool> setBooleanValue(PreferencesKeys key, bool value) async {
    return _preferences!.setBool(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) => _preferences!.getString(key.toString()) ?? '';
  bool getBoolValue(PreferencesKeys key) => _preferences!.getBool(key.toString()) ?? false;
  int getIntegerValue(PreferencesKeys key) => _preferences!.getInt(key.toString()) ?? -1;
  String getDynamicJson(PreferencesKeys key) => getStringValue(key);
}

enum PreferencesKeys { Temperature }
