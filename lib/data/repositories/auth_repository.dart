
import '../api/auth_api.dart';
import '../local/auth_local.dart';

class AuthRepository {
  static final instance = AuthRepository._();

  AuthRepository._();

  final AuthApi _authApi = AuthApi.instance;
  final AuthLocal _authLocal = AuthLocal.instance;

  Future<String> login(String email, String password) async {
    final token = await _authApi.login(
      email,
      password,
    );
    await _authLocal.setToken(
      token,
    );
    return token;
  }
}
