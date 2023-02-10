import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));
  static final SecureStorage _instance = SecureStorage._internal();

  factory SecureStorage() {
    return _instance;
  }
  SecureStorage._internal();

  Future save(String key, String value) async {
    return await _storage.write(key: key, value: value);
  }

  Future deleteAll() async {
    return await _storage.deleteAll();
  }

  Future getValue(String key) async {
    return await _storage.read(key: key);
  }

  Future deleteValue(String key) async {
    return await _storage.delete(key: key);
  }

  Future<Map<String, String>> getAll() async {
    return await _storage.readAll();
  }
}
