import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  late SharedPreferences instance;

  Future<void> initialize() async {
    instance = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    await instance.clear();
  }

  Future<void> setString(String key, String value) async {
    await instance.setString(key, value);
  }

  String? getString(String key) {
    return instance.getString(key);
  }

  int? getInt(String key) {
    return instance.getInt(key);
  }

  Future<void> setInt(String key, int value) async {
    await instance.setInt(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await instance.setBool(key, value);
  }

  bool? getBool(String key) {
    return instance.getBool(key);
  }

  Future<void> remove(String key) async {
    await instance.remove(key);
  }
}

final preferences = Preferences();
