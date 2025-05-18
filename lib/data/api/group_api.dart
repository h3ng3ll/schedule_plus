import 'package:dio/dio.dart';

import '../repositories/base_repository.dart';

class GroupApi {
  final BaseRepository _baseRepository = BaseRepository.instance;

  static final instance = GroupApi._();

  GroupApi._();

  Future<Response> fetchGroups() async {
    return await _baseRepository.api.get(
      '/Group/',
    );
  }
}
