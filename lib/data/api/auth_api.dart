import 'package:dio/dio.dart';

import '../../utils/client/dio_client.dart';

class AuthApi {
  final Dio _dio = DioClient.instance.dio;

  static final instance = AuthApi._();

  AuthApi._();

  Future<String> login(
    String email,
    String password,
  ) async {
    final res = await _dio.get(
      '/Authorization/login',
    );
    return res.data;
  }

  Future<String> register(
      String email,
      String password,
      ) async {
    final res = await _dio.get(
      '/Authorization/register',
    );
    return res.data;
  }
}
