import 'package:dio/dio.dart';


import '../repositories/base_repository.dart';

class AuthApi {
  final BaseRepository _baseRepository = BaseRepository.instance;

  static final instance = AuthApi._();

  AuthApi._();

  Future<Response> login(
    String email,
    String password,
  ) async {
    return await _baseRepository.api.post(
      '/Authorization/login',
      data: {
        'identifier': email,
        'password': password,
      },
    );
  }

  Future<Response> register(
    String email,
    String password,
    String? name,
  ) async {
    return await _baseRepository.api.post(
      '/Authorization/register',
      data: {
        'email': email,
        'password': password,
        'name': name,
      },
    );
  }
}
