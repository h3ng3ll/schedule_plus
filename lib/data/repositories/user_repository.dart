import 'package:dio/dio.dart';

import '../../model/user/user.dart';
import '../api/user_api.dart';

class UserRepository {
  final UserApi _userApi = UserApi.instance;
  static final instance = UserRepository._();

  UserRepository._();

  Future<User> me() async {
    try {
      final res = await _userApi.me();
      final user = User.fromJson(
        res.data['user'],
      );
      return user;
    } on DioException {
      rethrow;
    }
  }
}
