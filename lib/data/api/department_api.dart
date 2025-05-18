import 'package:dio/dio.dart';

import '../repositories/base_repository.dart';

class DepartmentApi {
  final BaseRepository _baseRepository = BaseRepository.instance;

  static final instance = DepartmentApi._();

  DepartmentApi._();

  Future<Response> fetchDepartments() async {
    return await _baseRepository.api.get(
      '/Department/',
    );
  }
}
