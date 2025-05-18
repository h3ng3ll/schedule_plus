import 'package:dio/dio.dart';

import '../../model/group/group.dart';

import '../api/group_api.dart';
import '../api/student_api.dart';

class StudentRepository {
  final StudentApi _groupApi = StudentApi.instance;
  static final StudentRepository instance = StudentRepository._();

  StudentRepository._();

  Future<Group> fetchGroup() async {
    try {
      final res = await _groupApi.me();

      final groupData = res.data['student']['group'];
      final Group group = Group.fromJson(
        groupData,
      );

      return group;
    } on DioException {
      rethrow;
    }
  }
}
