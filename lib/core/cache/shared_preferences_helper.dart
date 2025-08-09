import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> removeData({required String key}) async {
    await sharedPreferences.remove(key);
  }

  static Future<void> clearAllData() async {
    await sharedPreferences.clear();
  }

  static Future<void> saveDouble({
    required String key,
    required double value,
  }) async {
    debugPrint(
      "SharedPrefHelper : setDouble with key : $key and value : $value",
    );
    await sharedPreferences.setDouble(
      key,
      value,
    );
  }

  static Future<void> saveInt({
    required String key,
    required int value,
  }) async {
    debugPrint(
      "SharedPrefHelper : setInt with key : $key and value : $value",
    );
    await sharedPreferences.setInt(
      key,
      value,
    );
  }

  static Future<void> saveString({
    required String key,
    required String value,
  }) async {
    debugPrint(
      "SharedPrefHelper : setString with key : $key and value : $value",
    );
    await sharedPreferences.setString(
      key,
      value,
    );
  }

  static Future<void> saveBool({
    required String key,
    required bool value,
  }) async {
    debugPrint(
      "SharedPrefHelper : setBool with key : $key and value : $value",
    );
    await sharedPreferences.setBool(
      key,
      value,
    );
  }

  static Future<void> saveStringList({
    required String key,
    required List<String> value,
  }) async {
    debugPrint(
      "SharedPrefHelper : setData with key : $key and value : $value",
    );
    await sharedPreferences.setStringList(
      key,
      value,
    );
  }

  static List<String> getStringList({required String key}) {
    debugPrint('SharedPrefHelper : getStringList with key : $key');
    return sharedPreferences.getStringList(key) ?? [];
  }

  static bool getBool({required String key}) {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return sharedPreferences.getBool(key) ?? false;
  }

  static double getDouble({required String key}) {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  static int getInt({required String key}) {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return sharedPreferences.getInt(key) ?? 0;
  }

  static String getString({required String key}) {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return sharedPreferences.getString(key) ?? '';
  }
}