import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utils/client/dio_client.dart';
import '../local/auth_local.dart';

class NotificationApi {
  final Dio _dio;

  static instance([Dio? dio]) => NotificationApi._(dio);

  NotificationApi._([Dio? dio]) : _dio = dio ?? DioClient.instance.dio;

  Future<Map<String, dynamic>> fetchNotificationChannelConfig(
    String token,
  ) async {
    final res = await _dio.get(
      '/Notification/config',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        // contentType: 'application/json',
      ),
    );
    return jsonDecode(
      res.data,
    );
  }

  Future<void> registerUserToken(String fcmToken, String token) async {
    await _dio.post(
      '/Notification/saveToken',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        // contentType: 'application/json',
      ),
      data: jsonEncode(
        fcmToken,
      ),
    );
  }
}
