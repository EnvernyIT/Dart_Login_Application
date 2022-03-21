import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = const FlutterSecureStorage();

  static const _url = 'url';
  static const _username = 'username';
  static const _password = 'password';

  Future<void> writeSecureData(String key, String? value) async {
    var writeData = await _storage.write(
        key: key, value: value, aOptions: _getAndroidOptions());
    return writeData;
  }

  static Future<String?> readSecureURLData() async {
    var readData =
        await _storage.read(key: _url, aOptions: _getAndroidOptions());
    return readData;
  }

  static Future<String?> readSecureUsernameData() async {
    var readData =
        await _storage.read(key: _username, aOptions: _getAndroidOptions());
    return readData;
  }

  static Future<String?> readSecurePasswordData() async {
    var readData =
        await _storage.read(key: _password, aOptions: _getAndroidOptions());
    return readData;
  }

  static Future<void> deleteSecureURLData() async {
    var deleteData =
        await _storage.delete(key: _url, aOptions: _getAndroidOptions());
    return deleteData;
  }

  static Future<void> deleteSecureUsernameData() async {
    var deleteData =
        await _storage.delete(key: _username, aOptions: _getAndroidOptions());
    return deleteData;
  }

  static Future<void> deleteSecurePasswordData() async {
    var deleteData =
        await _storage.delete(key: _password, aOptions: _getAndroidOptions());
    return deleteData;
  }

  Future<void> deleteAllSecureData() async {
    await _storage.deleteAll(aOptions: _getAndroidOptions());
  }

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
