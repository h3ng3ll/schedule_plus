import 'package:dio/dio.dart';

import '../../model/group/group.dart';

import '../api/group_api.dart';


class GroupRepository {
  final GroupApi _groupApi = GroupApi.instance;
  static final GroupRepository instance = GroupRepository._();

  GroupRepository._();

  Future<List<Group>> fetchGroups({
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    try {
      final res = await _groupApi.fetchGroups();
      final List<Group> groups = List<Group>.from(
        (res.data as List<dynamic>).map(
          (e) => Group.fromJson(e),
        ),
      ).toList();

      return groups;

    } on DioException {
      rethrow;
    }
  }
}
