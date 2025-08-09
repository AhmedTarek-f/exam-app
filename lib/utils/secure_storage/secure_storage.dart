import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:exam_app/core/constants/const_keys.dart';

abstract class SecureStorage {
  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  static final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  static Future<void> saveData({
    required String key,
    required String value,
  }) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      log('SecureStorage error: $e');
      await _storage.deleteAll();
      await _storage.write(key: key, value: value);
    }
  }

  static Future<void> saveUserToken({required String? token}) async {
    await saveData(key: ConstKeys.tokenKey, value: token ?? "");
  }

  static Future<String?> getData({required String key}) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteData({required String key}) async {
    await _storage.delete(key: key);
  }
}
