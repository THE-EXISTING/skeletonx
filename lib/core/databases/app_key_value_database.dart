import 'package:falconx/falconx.dart';

abstract class AppSecureLocalDatabase {
  final SecureStorageX _secureStorage;

  const AppSecureLocalDatabase({
    SecureStorageX secureStorage = SecureStorageX.instance,
  }) : _secureStorage = secureStorage;

  @protected
  Future<void> save({required String key, required String data}) =>
      _secureStorage.save(key: key, data: data);

  @protected
  Future<String> load({required String key, String? defaultData}) =>
      _secureStorage.load(key: key, defaultData: defaultData);

  @protected
  Future<void> delete({required String key}) =>
      _secureStorage.delete(key: key);

  Future<void> deleteAll() => _secureStorage.deleteAll();
}
