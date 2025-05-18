import 'package:dio/dio.dart';

import '../../model/department/department.dart';

import '../api/department_api.dart';


class DepartmentRepository {
  final DepartmentApi _departmentApi = DepartmentApi.instance;
  static final DepartmentRepository instance = DepartmentRepository._();

  DepartmentRepository._();

  Future<List<Department>> fetchDepartments() async {
    try {
      final res = await _departmentApi.fetchDepartments();
      final List<Department> departments = List<Department>.from(
        (res.data as List<dynamic>).map(
          (e) => Department.fromJson(
            e,
          ),
        ),
      ).toList();

      return departments;
    } on DioException {
      rethrow;
    }
  }
}
