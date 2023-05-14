import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum StorageKey { name, email }

class KeyChain {
  late final FlutterSecureStorage storage;
  static final KeyChain instance = KeyChain._internal();

  factory KeyChain() {
    return instance;
  }

  KeyChain._internal() {
    storage = FlutterSecureStorage();
  }
}

class SecureStorage {
  static Future<void> removeAll() async {
    await KeyChain.instance.storage.deleteAll();
  }

  static Future<void> removeWithKey(key) async {
    await KeyChain.instance.storage.delete(key: key);
  }

  static Future<void> setName(value) async {
    await KeyChain.instance.storage
        .write(key: StorageKey.name.toString(), value: value);
  }

  static Future<void> setEmail(value) async {
    await KeyChain.instance.storage
        .write(key: StorageKey.email.toString(), value: value);
  }

  static Future<String?> getName() async {
    String? name =
        await KeyChain.instance.storage.read(key: StorageKey.name.toString());
    return name == '' ? null : name;
  }

  static Future<String?> getEmail() async {
    String? email =
        await KeyChain.instance.storage.read(key: StorageKey.email.toString());
    return email == '' ? null : email;
  }
}
