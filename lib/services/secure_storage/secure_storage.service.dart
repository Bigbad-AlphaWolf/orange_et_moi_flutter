import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));
  static final SecureStorage _instance = SecureStorage._internal();

  factory SecureStorage() {
    return _instance;
  }
  SecureStorage._internal();

  Future save(String key, String value) async {
    return await storage.write(key: key, value: value);
  }

  Future deleteAll() async {
    return await storage.deleteAll();
  }

  Future getValue(String key) async {
    return await storage.read(key: key);
  }

  Future deleteValue(String key) async {
    return await storage.delete(key: key);
  }

  Future<Map<String, String>> getAll() async {
    return await storage.readAll();
  }
}
