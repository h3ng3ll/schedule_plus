import 'package:dio/dio.dart';

import '../../model/user/user.dart';
import '../../utils/extensions/response_ext.dart';
import '../api/auth_api.dart';
import 'base_repository.dart';

class AuthRepository {
  final BaseRepository _baseRepository = BaseRepository.instance;

  static final instance = AuthRepository._();

  AuthRepository._();

  final AuthApi _authApi = AuthApi.instance;

  Future<User> login(
    String email,
    String password,
  ) async {
    try {
      final res = await _authApi.login(
        email,
        password,
      );
      if (!res.isSuccessCode) {
        throw DioException(
          requestOptions: res.requestOptions,
          response: res,
          error: res.data['error'],
        );
      }

      final token = res.data['jwt'];
      await _baseRepository.saveToken(
        token,
      );
      final user = User.fromJson(
        res.data['user'],
      );
      return user;
    } on DioException {
      rethrow;
    }
  }

  Future<User> register(
    String email,
    String password,
    String? name,
  ) async {
    try {
      final res = await _authApi.register(
        email,
        password,
        name,
      );
      if (!res.isSuccessCode) {
        throw DioException(
          requestOptions: res.requestOptions,
          response: res,
          error: res.data['error'],
        );
      }
      final token = res.data['jwt'];
      await _baseRepository.saveToken(
        token,
      );
      final user = User.fromJson(
        res.data['user'],
      );
      return user;
    } on DioException {
      rethrow;
    }
  }
}
