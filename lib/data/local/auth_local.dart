import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/storage/shared_prefs_service.dart';

class AuthLocal {
  final SharedPrefsService _sharedPrefsService = SharedPrefsService.instance;
  static final instance = AuthLocal._();

  AuthLocal._();

  final _token = 'auth_api_token';

  Future<String?> getToken() async {
    final String? res = await _sharedPrefsService.getValue(
      _token,
    );
    return res;
  }

  Future<void> setToken(String token) async =>
      await _sharedPrefsService.setValue(
        _token,
        token,
      );
}
