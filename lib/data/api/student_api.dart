import 'package:dio/dio.dart';

import '../repositories/base_repository.dart';

class StudentApi {
  final BaseRepository _baseRepository = BaseRepository.instance;

  static final instance = StudentApi._();

  StudentApi._();

  Future<Response> me() async {
    return await _baseRepository.api.get(
      '/Student/me',
    );
  }
}
