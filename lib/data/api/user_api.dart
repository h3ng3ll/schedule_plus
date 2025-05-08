import 'package:dio/dio.dart';

import '../repositories/base_repository.dart';

class UserApi {
  final BaseRepository _baseRepository = BaseRepository.instance;

  static final instance = UserApi._();

  UserApi._();

  Future<Response> me() async {
    return await _baseRepository.api.get(
      '/User/me',
    );
  }
}
