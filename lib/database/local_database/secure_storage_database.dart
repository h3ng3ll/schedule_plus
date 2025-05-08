
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageDatabase {
  SecureStorageDatabase._();

  static final instance = SecureStorageDatabase._();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final String _jwtTokenKey = 'jwtToken1234';

  Future<void> setJwtToken(String token) async {
    return await _secureStorage.write(
      key: _jwtTokenKey,
      value: token,
    );
  }

  Future<void> deleteJwtToken() async {
    return await _secureStorage.delete(
      key: _jwtTokenKey,
    );
  }

  Future<String?> getJwtToken() async {
    return await _secureStorage.read(
      key: _jwtTokenKey,
    );
  }
}
